class Link #to the past
  attr_accessor :key, :val, :next, :prev, :next_chron, :prev_chron

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
    @next_chron = nil
    @prev_chron = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.nil?
  end

  def get(key)
    # self.select { |k| if k.key == key }
    cur_node = @head
    return nil unless cur_node

    until cur_node.nil?
      return cur_node.val if cur_node.key == key
      cur_node = cur_node.next
    end

    nil
  end

  def get_link(key)
    cur_node = @head
    return nil unless cur_node

    until cur_node.nil?
      return cur_node if cur_node.key == key
      cur_node = cur_node.next
    end

    nil
  end

  def include?(key)
    cur_node = @head
    return nil unless cur_node

    until cur_node.nil?
      return true if cur_node.key == key
      cur_node = cur_node.next
    end

    false
  end

  def insert(key, val)
    new_link = Link.new(key, val)
    if @head.nil?
      @head = new_link
      @tail = new_link
    else
      @tail.next = new_link
      new_link.prev = @tail
      @tail = new_link
    end
    new_link
  end

  def remove(key)
    cur_node = @head
    return nil unless cur_node
    if key == @head.key
      head_node = @head
      @head = @head.next
      @head.prev = nil
      return head_node
    elsif key == @tail.key
      tail_node = @tail
      @tail = @tail.prev
      @tail.next = nil
      return tail_node
    end
    until cur_node.nil?
      if cur_node.key == key
        cur_node.prev.next = cur_node.next
        cur_node.next.prev = cur_node.prev
        return cur_node
      end
      cur_node = cur_node.next
    end

    nil
  end

  def each
    cur_node = @head
    return nil unless cur_node

    until cur_node == nil
      yield cur_node
      cur_node = cur_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end
