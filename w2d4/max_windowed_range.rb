require './stacks_and_queues.rb'

def windowed_max_range(arr, window)
  current_max_range = nil
  (arr.size - window + 1).times do |index|
    fin_index = index + window - 1
    max = arr[index..fin_index].max
    min = arr[index..fin_index].min
    cur_range = max - min
    current_max_range = cur_range if current_max_range.nil? || cur_range > current_max_range
  end
  current_max_range
end

def windowed_max_better(arr, window)
  #Jiu Li, do the thing!
  q = StackQueue.new

  window.times do |idx|
    q.enqueue(arr[idx])
  end

  current_max_range = q.max - q.min

  (arr.size - window).times do |index|
    q.dequeue
    q.enqueue(arr[index + window])
    cur_range = q.max - q.min
    current_max_range = cur_range if current_max_range < cur_range
  end

  current_max_range
end
