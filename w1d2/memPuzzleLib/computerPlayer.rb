class ComputerPlayer
  def initialize(name)
    @name = name
    @level = [1, 2, 3].sample
    @known_grid = Array.new(2 ** @level) { Array.new(4) }
    @known_pair = []
    @found_pairs = []
    @first_turn = true
  end

  def receive_revealed_card(loc, sym)
    @known_grid.each_index do |ind1|
      @known_grid[ind1].each_with_index do |val, ind2|
        if !@found_pairs.include?(sym) && val == sym
          @first_turn ? @known_pair = [loc, [ind1, ind2]] : @known_pair = [ind1, ind2]
          @found_pairs << sym
          return
        end
      end
    end
    @known_grid[loc[0]][loc[1]] = sym
  end

  def get_input(grid_size)
    puts "Quack"
    if @known_pair.size >= 1
      popped_loc =  @known_pair.pop
      return popped_loc
    end
    @known_grid.each_index do |ind1|
      @known_grid[ind1].each_with_index do |loc, ind2|
        if !loc
          return [ind1, ind2]
        end
      end
    end
    @first_turn = !@first_turn
  end

  def get_difficulty
    @level
  end
end
