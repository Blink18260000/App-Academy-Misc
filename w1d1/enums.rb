class Array
  def my_each
    i = 0
    while i < self.size
      yield(self[i])
      i += 1
    end
    self
  end

  def my_select
    curr_arr = []
    self.my_each do |thing|
      curr_arr << thing if yield(thing)
    end
    curr_arr
  end

  def my_reject
    curArr = []
    self.my_each do |thing|
       if !yield(thing)
         curArr << thing
       end
    end
    curArr
  end

  def my_any?
    self.my_each do |thing|
       if yield(thing)
         return true
       end
    end
    false
  end

  def my_all?
    self.my_each do |thing|
       if !yield(thing)
         return false
       end
    end
    true
  end

  def my_flatten
    arr = []
    self.my_each do |thing|
      if thing.kind_of?(Array)
        arr += thing.my_flatten
      else
        arr << thing
      end
    end
    arr
  end

  def my_zip(*args)
    finArr = []
    self.each_index do |index|
      curArr = [self[index]]
      args.each { |thing| curArr << thing[index] }
      finArr << curArr
    end
    finArr
  end

  def my_rotate(num = 1)
    finArr = []
    self.each_index do |index|
      newIndex = index + num
      newIndex %= self.size
      # while newIndex >= self.size
      #   newIndex -= self.size
      # end
      # while newIndex < 0
      #   newIndex += self.size
      # end
      finArr << self[newIndex]
    end
    finArr
  end

  def my_join(str = "")
    finStr = ""
    self.my_each do |curStr|
      finStr << curStr
      finStr << str
    end
    finStr[0...-str.size]
  end

  def my_reverse
    finArr = []
    self.each_index do |index|
      finArr << self[-1 - index]
    end
    finArr
  end
end
