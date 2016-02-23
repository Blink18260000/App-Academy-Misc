require_relative 'tic_tac_toe'
require "byebug"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
    @positions = [[0,0],[0,1],[0,2],[1,0],[1,1],[1,2],[2,0],[2,1],[2,2]]
    # @children ||= []
  end

  def losing_node?(evaluator)
    if @board.over? && @board.winner == flip(evaluator)
      return true
    end
    if @board.over? && (@board.winner == evaluator || @board.tied?)
      return false
    end
    #debugger
    # return false if evaluator == :o
    if (evaluator == @next_mover_mark)
      children.all? { |child| child.losing_node?(evaluator) }
    else
      children.any? { |child| child.losing_node?(evaluator) } #change this line!!!
    end
    # false
  end

  def winning_node?(evaluator)
    if @board.over? && @board.winner == evaluator
      return true
    end
    if @board.over? && (@board.winner != evaluator || @board.tied?)
      return false
    end


    if (evaluator == @next_mover_mark)
      children.all? { |child| child.winning_node?(evaluator) }
    else
      children.any? { |child| child.winning_node?(evaluator) }
    end
    # true
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    @positions.each do |pos|
      if @board[pos].nil?
        new_board = @board.dup
        new_board[pos] = next_mover_mark
        children << TicTacToeNode.new(new_board, flip(next_mover_mark), pos)
      end
    end
    children
  end

  def flip(sym)
    if sym == :x
      return :o
    else
      return :x
    end
  end
end
