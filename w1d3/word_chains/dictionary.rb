class WordChainer

  def initialize(dictionary_file_name)
    @dictionary = File.readlines(dictionary_file_name).map{|line| line.chomp}
  end

  def adjacent_words(word)
    @dictionary.select do |curr_word|
      unless curr_word.length == word.length
        false
      else
        off_by_one(word, curr_word)
      end
    end
  end

  def off_by_one(word, test_word)
    word.length.times do |index_of_word|
      d_word = word.dup
      d_test_word = test_word.dup
      d_word[index_of_word] = "\0"
      d_test_word[index_of_word] = "\0"
      return true if d_word == d_test_word
    end
    false
  end

  def run(start_word, end_word)
    populate_dictionary(start_word, end_word)
    back_list = []
    loop_word = end_word
    while loop_word
      back_list << loop_word
      loop_word = @all_seen_words[loop_word]
    end
    back_list.reverse.each do |the_end|
      puts the_end
    end
  end

  def populate_dictionary(start_word, end_word)
    @current_words = [start_word]
    @all_seen_words = {start_word => nil}
    while !@current_words.empty?
      new_current_words = []
      @current_words.each do |this_word|
        adj_words = adjacent_words(this_word)
        adj_words.each do |too_many_words|
          unless @all_seen_words.include?(too_many_words)
            @all_seen_words[too_many_words] = this_word
            new_current_words << too_many_words
            return if too_many_words == end_word
          end
        end
      end
      # puts new_current_words
      @current_words = new_current_words
    end
  end
end



if __FILE__ == $PROGRAM_NAME
  test = WordChainer.new("dictionary.txt")
  test.run("dick", "fuck")
end
