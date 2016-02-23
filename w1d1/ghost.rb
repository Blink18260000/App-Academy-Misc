class Game

  def initialize(player1, player2, dictionary_path)
    @player1 = player1
    @player2 = player2
    @fragment = ""
    words = []
    File.open(dictionary_path, "r") do |f|
      f.each_line do |line|
        words << line.chomp
      end
    end
    @dictionary = words
    @current_player = player1
    @previous_player = player2
    @over = false
  end

  def next_player!
    @current_player, @previous_player = @previous_player, @current_player
  end

  def take_turn(player)
    need_play = true
    invalid = false
    while need_play
      if invalid
        player.alert
      end
      current_guess = player.guess(@fragment)
      if valid_play?(current_guess)
        need_play = false
      end
      invalid = true
    end
    @fragment += current_guess
    if @over
      @current_player.lose
      return false
    end
    true
  end

  def play
    continue = true
    while continue
      puts @over
      continue = take_turn(@current_player)
      next_player!
    end
  end

  def valid_play?(str)
    if str.length == 1
      hold_fragment = @fragment + str
      @dictionary.each do |word|
        if word[0..(hold_fragment.size - 1)] == hold_fragment
          if word == hold_fragment
            @over = true
          end
          return true
        end
      end
    end
    false
  end

end

class Player

  def initialize(name)
    @name = name
  end

  def guess(fragment)
    puts "Guess! #{fragment + "_"}"
    g = gets.chomp
  end

  def alert
    puts "Invalid! Try again!"
  end

  def lose
    puts "You lose!"
  end
end
