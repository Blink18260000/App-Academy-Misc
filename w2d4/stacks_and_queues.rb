require 'byebug'

class MyQueue

  def initialize
    @store = []
  end

  def enqueue(item)
    @store << item
  end

  def dequeue
    @store.shift
  end

  def peek
    @store.first
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end

class MyStack
  def initialize
    @store = []
  end

  def pop
    @store.pop[0]
  end

  def push(el)
    if max.nil? || el > max
      cur_max = el
    else
      cur_max = max
    end
    if min.nil? || el < min
      cur_min = el
    else
      cur_min = min
    end

    @store.push([el, cur_max, cur_min])
  end

  def peek
    @store.last
  end

  def size
    @store.size
  end

  def empty?
    @store.empty?
  end

  def max
    @store.empty? ? nil : @store.last[1]
  end

  def min
    @store.empty? ? nil : @store.last[2]
  end

end

class StackQueue
  def initialize
    @push_stack = MyStack.new
    @pop_stack = MyStack.new
  end

  def enqueue(el)
    @push_stack.push(el)
  end

  def dequeue
    return nil if empty?
    if @pop_stack.empty?
      @pop_stack.push(@push_stack.pop) until @push_stack.empty?
    end
    @pop_stack.pop
  end

  def size
    @push_stack.size + @pop_stack.size
  end

  def empty?
    @push_stack.empty? && @pop_stack.empty?
  end

  def max
    return @pop_stack.max if @push_stack.max.nil?
    return @push_stack.max if @pop_stack.max.nil?
    @push_stack.max > @pop_stack.max ? @push_stack.max : @pop_stack.max
  end

  def min
    return @pop_stack.min if @push_stack.min.nil?
    return @push_stack.min if @pop_stack.min.nil?
    @push_stack.min < @pop_stack.min ? @push_stack.min : @pop_stack.min
  end

end
