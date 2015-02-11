class WordExplorer
  attr_reader :word_list, :source, :candidates

  def initialize
    @word_list = "app/fixtures/main_dictionary.txt"
    @candidates = IO.readlines(@word_list).each(&:chomp!)
  end

  def display_of_related_words(word, num_of_constants = nil)
    array_of_test_patterns_from_seed(word, num_of_constants).each_with_object({}) do |pattern, result|
      wanted_matches = retrieve_all_matches(word, pattern).delete_if { |match| match == word }
      result[pattern] = wanted_matches unless wanted_matches.empty?
    end
  end

  # def display_of_related_words(word, num_of_constants = nil)
  #   if num_of_constants
  #     array_of_test_patterns_from_seed(word, num_of_constants).each_with_object({}) do |pattern, result|
  #       wanted_matches = retrieve_all_matches(word, pattern).delete_if { |match| match == word }
  #       result[pattern] = wanted_matches unless wanted_matches.empty?
  #     end
  #   else
  #     result = nil
  #     trial_num = 0
  #     while (result == nil || result == {}) && trial_num <= word.length
  #       trial_num += 1
  #       result = display_of_related_words(word, trial_num)
  #     end
  #   end
  #   result
  # end


  def to_s
    "nothing to see here"
  end

  private

  def array_of_test_patterns_from_seed(word, num_of_constants)
    initial_array = word.split(//)
    combos = (0...(word.length)).to_a.combination(num_of_constants)
    combos.map do |combo|
      pattern = initial_array.map.with_index { |ltr, idx| combo.include?(idx) ? "." : ltr }
      pattern.join
    end
  end

  def words_by_length(word)
    @candidates.select {|cand| cand.length == word.length }
  end

  def retrieve_all_matches(word, pattern)
    words_by_length(word).grep(/^#{pattern}$/)
  end

end