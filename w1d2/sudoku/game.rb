class Game

  def def initialize(player)
    @player = player
    

  end

end

if __FILE__ == $PROGRAM_NAME
  theGame = Game.new(HumanPlayer.new("person"))
  theGame.play
end
