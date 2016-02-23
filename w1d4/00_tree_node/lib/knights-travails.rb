require "./tree-node.rb"
require "byebug"

class KnightPathFinder

  def initialize(loc)
    @root = PolyTreeNode.new(loc)
  end

  def find_path(loc)
    leaf = @root.bfs(loc)
    path = []
    until leaf.nil?
      path << leaf.value.dup
      leaf = leaf.parent
    end
    path.reverse
  end

  def move_deltas
    moves = []
    [-1,1].each do |val1|
      [-2,2].each do |val2|
        moves << [val1, val2]
      end
    end

    result = moves.dup

    moves.each do |move|
      result << move.reverse
    end

    result
  end

  def new_move_positions(loc)
    nodes = []
    move_deltas.each do |d_loc|
      end_loc = [loc[0] + d_loc[0], loc[1] + d_loc[1]]
      nodes << PolyTreeNode.new(end_loc) if valid_move?(end_loc) #(hashtag)tight
    end
    nodes
  end

  def valid_move?(loc)
    # (0...8).include?(loc[0]) && (0...8).include?(loc[1])
    (loc[0] < 8 && loc[0] >= 0) && (loc[1] < 8 && loc[1] >= 0)
  end

  def build_move_tree
    queue = [@root]
    seen_squares = {@root.value => true}

    until queue.empty?
      current_child = queue.shift
      child_nodes = new_move_positions(current_child.value)
      child_nodes.each do |node|
        node.parent=(current_child) unless seen_squares[node.value]
        seen_squares[node.value] = true
      end
      current_child.children.each do |el|
        queue.push(el)
      end
    end
    nil
  end

end
