class Board
  LEVEL_STRS = {
    1 => "AKQJ",
    2 => "AKQJ0987",
    3 => "AKQJ0987654321\@\&"
  }
  def initialize(level)
    @grid = Array.new(LEVEL_STRS[level].length / 2) { Array.new(4) }
    self.populate(level)
  end

  def get_size
    @grid.size
  end

  def populate(level)
    card_symbols = LEVEL_STRS[level].split(//)
    cards = []
    card_symbols.each do |sym|
      2.times do
        cur_card = Card.new(sym)
        cards << cur_card
      end
    end
    cards.shuffle!
    @grid.each do |row|
      row.each_index do |ind|
        row[ind] = cards.pop
      end
    end
  end

  def render
    system("clear")
    print "| \\   0     1     2     3   |\n"
    @grid.each_index do |ind|
      print "| #{ind} "
      @grid[ind].each do |spot|
        spot.removed ? print("      ") : print("#{spot.to_s} ")
      end
      print "|\n"
    end
  end

  def won?
   !(@grid.flatten.any? { |card| !(card.removed) })
  end

  def reveal(location) # location is of the form [row, column]
    @grid[location[0]][location[1]].flip!
    [location, @grid[location[0]][location[1]].value]
  end

  def match?(loc1, loc2)
    result = @grid[loc1[0]][loc1[1]] == @grid[loc2[0]][loc2[1]]
    if result
      @grid[loc1[0]][loc1[1]].removed = true
      @grid[loc2[0]][loc2[1]].removed = true
    else
      @grid[loc1[0]][loc1[1]].flip!
      @grid[loc2[0]][loc2[1]].flip!
    end
    result
  end
end
