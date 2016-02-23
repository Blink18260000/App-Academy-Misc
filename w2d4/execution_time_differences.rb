# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

#my_min_I: time complexity O(n^2)
def my_min_I(list)

  list.each do |el|
    list.each_with_index do |el2, idx|
      break if el2 < el
      return el if idx == list.length - 1
    end
  end

end

#my_min_II: time complexity O(n)
def my_min_II(list)
  min = list[0]
  list.each do |el|
    min = el if el < min
  end
  min
end

#largest_sub_sum_I: time complexity O(n^2)
def largest_sub_sum_I(list)
  subsets = []

  list.each_index do |idx1|
    list.each_index do |idx2|
      if idx2 > idx1
        subsets << list[idx1..idx2]
      end
    end
  end

  biggest_sum = subsets[0].inject(:+)
  subsets.each do |some_set|
    cur_sum = some_set.inject(:+)
    biggest_sum = cur_sum if cur_sum > biggest_sum #totes
  end

  biggest_sum
end

#largest_sub_sum_II: time complexity O(n), memory complexity O(1)
def largest_sub_sum_II(list)
  least_negative = list[0]
  running_sum = 0
  largest_sum = running_sum
  all_negative = true

  list.each do |el|
    least_negative = el if el > least_negative
    all_negative = false if el >= 0
    running_sum += el
    if running_sum > largest_sum
      largest_sum = running_sum
    else
      running_sum = 0
    end
  end

  all_negative ? least_negative : largest_sum
end
