require "byebug"

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    running_hash = 0
    self.each do |el|
      running_hash += (el).object_id.hash
      running_hash = running_hash.hash
    end
    running_hash.hash
  end
end

class String
  def hash
    running_hash = 0
    self.each_char do |el|
      # debugger
      running_hash += el.ord.hash
      running_hash = running_hash.hash
    end
    running_hash.hash
  end
end

class Hash
  def hash
    running_hash = 0
    each do |k, v|
      running_hash += k.hash + v.hash
    end
    running_hash.hash
  end
end
