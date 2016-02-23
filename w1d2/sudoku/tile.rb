class Tile
  attr_reader :given

  def initialize(value)
    @value = value
    @value == 0 ? @given = false : @given = true
  end


end
