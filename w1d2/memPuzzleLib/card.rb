class Card
  attr_reader :value, :up
  attr_accessor :removed

  def initialize(value)
    @value = value
    @up = false
    @removed = false
  end

  def flip!
    @up ? @up = false : @up = true
  end

  def to_s
    @up ? "[ #{@value} ]" : "[   ]"
  end

  def ==(card2)
    self.value == card2.value
  end

end
