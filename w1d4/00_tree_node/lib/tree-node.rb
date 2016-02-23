class PolyTreeNode
  attr_reader :value, :parent
  attr_accessor :children

  def initialize(value)
    @parent = nil
    @children = []
    @value = value
  end

  def parent=(parent)
    unless @parent.nil?
      @parent.children.delete(self)
    end

    @parent = parent
    parent.children << self  unless parent.nil? || parent.children.include?(self)
  end

  def add_child(child)
    child.parent = self
  end

  def remove_child(child)
    if @children.include?(child)
      child.parent = nil
    else
      raise "No such child"
    end
  end

  def dfs(target)
    return self if @value == target

    @children.each do |child|
      result = child.dfs(target)
      return result unless result.nil?
    end
    nil
  end

  def bfs(target)
    return self if @value == target
    queue = [self]

    until queue.empty?
      cur_child = queue.shift
      return cur_child if cur_child.value == target
      cur_child.children.each do |el|
        queue.push(el)
      end
    end
    nil
  end
end
