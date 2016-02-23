class HumanPlayer
  def initialize(name)
    @name = name
  end

  def receive_revealed_card(loc, card)
  end

  def get_input(grid_size)
    puts "Pick a card, any card."
    invalid = true
    while invalid
      answer = gets.chomp.split( / *, */ ).map(&:to_i)
      if (0...grid_size).include?(answer[0]) && (0...4).include?(answer[1])
        invalid = false
      end
    end
    answer

  end

  def get_difficulty
    invalid = true
    while invalid
      puts "WHAT LEVEL??? (1, 2, or 3)"
      answer = gets.chomp
      if ["1", "2", "3"].include?(answer)
        invalid = false
      end
    end
    answer.to_i
  end
end
