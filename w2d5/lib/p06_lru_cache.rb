require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new(max)
    @store = LinkedList.new #Alarming.
    @max = max
    @prc = prc
    @chron_head = nil
    @chron_tail = nil
  end

  def count
    @map.count
  end

  def get(key)
    value = @map.get(key)
    if value
      update_link!(@map.get_link(key))
      value
    else
      calc!(key)
    end
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    # suggested helper method; insert an (un-cached) key

    if count == @max #calculated new one, DID break limit, fix all the things.
      eject!
    end
    #calculated new one, didn't break limit.
    new_link = @map[key]= prc.call(key)
    if @chron_head.nil?
      @chron_head = new_link
      @chron_tail = new_link
    else
      @chron_tail.next_chron = new_link
      new_link.prev_chron = @chron_tail
      @chron_tail = new_link
    end
    new_link.val
  end

  def update_link!(link)
    # suggested helper method; move a link to the end of the list
    #TODO: We found a number in our cache, and used it. Resets chron position. All Pointer reassignment.
  end

  def eject! #TODO: Fix all the things!
    node_to_delete = @chron_head
    node_to_delete.next_chron.prev_chron = nil
    @chron_head = node_to_delete.next_chron

  end
end
