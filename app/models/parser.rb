class Parser
  attr_reader :word_list, :source, :candidates

  def initialize
    @word_list = "/puzzles/main_dictionary.txt"
    @source = "/puzzles/DWG_puzzles.txt"
    @candidates = IO.readlines(@word_list).each(&:chomp!)
  end

  def match_from_clue(word)
    pattern = word.split(" ").join("").gsub("_",".").downcase
    return Regexp.new("^#{pattern}$")
  end

  def difficulty(words)
    values = []
    words.each do |word|
      counter = 0
      matcher = match_from_clue(word)
      @candidates.each do |cand|
        counter += 1 if cand =~ matcher
      end
      values << counter
    end
    Math.sqrt(values.min).floor
  end

end