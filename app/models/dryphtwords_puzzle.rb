class DryphtwordsPuzzle < ActiveRecord::Base

  #ASSOCIATIONS
  has_many :puzzle_views
  belongs_to :creator, class_name: "User"

  #CUSTOM METHODS
  def validate_answer(puzzle, user_input)

  end

  def solution_words
# solution(s) are strings of constants, interleaved with dots to represent the variables. clue(s) are the reverse. This method provides the actual solution words. If multiple solutions exist, it's organized as an array of arrays.
    result = []
    self.solution_string.split(",").each do |sol|
      subresult = []
      word = []
      self.clue_string.split(",").each do |clue|
        zipped_array = sol.split(//).zip(clue.split(/\ /))
        word = zipped_array.map do |pair|
          pair[0] =~ /[[:alpha:]]/ ? pair[0] : pair[1]
        end
        subresult << word.join.downcase # an array of the words in this solution
      end
      result << subresult # an array of the arrays of words for each possible solution
    end
    result
  end

  def member_word?(word)
    solution_words.flatten.include? (word)
  end

  def to_s
    result = ""
    self.clue_string.split(",").each {|word| result += word + "\n" }
    result
  end

  def clues
    self.clue_string.gsub(/\s+/, '').split(",")
  end
end
