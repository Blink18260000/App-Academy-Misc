require_relative 'board'
require_relative 'card'
require_relative 'humanPlayer'
require_relative 'computerPlayer'

class Game
  def initialize(player)
    @player = player
    @board = Board.new(player.get_difficulty)
  end

  def play
    while !(@board.won?)
      play_turn
    end
    system("clear")
    puts "You matched all the cards!"
  end

  def play_turn
    @board.render
    guess = @player.get_input(@board.get_size)
    loc1, sym = @board.reveal(guess)
    @player.receive_revealed_card(loc1, sym)

    @board.render
    loc2, sym = @board.reveal(@player.get_input(@board.get_size))
    @player.receive_revealed_card(loc2, sym)
    @board.render

    puts "\n"
    sleep(3)
    @board.match?(loc1, loc2)
  end
end


if __FILE__ == $PROGRAM_NAME
  theGame = Game.new(ComputerPlayer.new("person"))
  theGame.play
end
