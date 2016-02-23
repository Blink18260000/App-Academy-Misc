class Board

  def initialize(theGrid)
    @grid = theGrid
    p @grid
  end

  def self.from_file(path)
    tile_grid = []
    File.open(path).readlines.each do |row|
      soduku_nums = row.split(//).map(&:to_i)
      this_row = []
      soduku_nums.each do |num|
        this_row << Tile.new(num)
      end
      tile_grid << this_row
    end
    Board.new(tile_grid)
  end
end
