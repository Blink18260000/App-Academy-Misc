def rec_range(start, end_num)
  return [] if end_num < start
  return [start] if start == end_num
  rec_range(start, end_num -1) << end_num
end

def rec_exp_1(base, exp)
  return 1 if exp == 0
  base * rec_exp_1(base, exp - 1)
end

def rec_exp_2(base, exp)
  return 1 if exp == 0
  return base if exp == 1
  exp % 2 == 0 ? rec_exp_2(base, exp/2) ** 2 : base * rec_exp_2(base, (exp - 1) / 2) ** 2
end

class Array
  def deep_dup
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr << el.deep_dup
      else
        new_arr << el.dup
      end
    end
    new_arr
  end
end

def fibonacci(num)
  return [] if num == 0
  return [0] if num == 1
  return [0,1] if num == 2
  prev_fib = fibonacci(num-1)
  prev_fib << (prev_fib[-1] + prev_fib[-2])
end

def b_search(array, target)
  #Validity checks
  return nil unless target.between?(array[0], array.last)
  return nil if array.empty?
  #Sort into left/right
  pivot = array[array.length / 2]
  return array.length / 2 if pivot == target
  left, right = [], []
  array.each { |el| el < pivot ? left << el : right << el}
  #Calculate index (the recursive bit)
  if target <= pivot
    ind = b_search(left, target)
  else
    ind = b_search(right, target)
  end
  return ind if ind.nil?
  target <= pivot ? ind : ind += left.size
end

def make_change(target, coin_array)
  #puts "target: #{target}, coin_array#{coin_array}"
  #Corner cases
  return nil if target == 0
  return [target] if coin_array.include?(target)
  #Initialize possible combo list
  coin_combos = []
  #This recursion should check all combinations including the top size coin
  coin = coin_array[0]
  coin_count = 0

  remaining_coins = coin_array.drop(1)
  current_coins = []

  coin_combos << make_change(target, remaining_coins) if remaining_coins.size > 0
  #For each type of coin, try all mono-coin combos, and test remainder
  while target >= coin
    coin_count += 1
    current_coins << coin
    target -= coin
    #if current_coins is already a solution, shovel it into the solution list
    if target == 0
      coin_combos << current_coins if target == 0
    else
      #make sure there are coins to work with!!!
      if remaining_coins.size > 0
        #test remainder recursively
        remainder_change = make_change(target, remaining_coins)
        #dup current_coins, so we can save this solution without breaking current_coins
        the_dup = current_coins.dup
        #shovel this solution into the solution list
        coin_combos << the_dup.concat(remainder_change) if remainder_change
      end
    end
    #coin_combos << the_dup #if the_dup.inject(:+) == target

  end

  current_min = nil
  coin_combos.each do |combination|
    current_min = combination if current_min.nil? || combination.length < current_min.length
  end

  current_min
end

def merge_sort(array)
  #break up the things
  return array if array.length == 1
  left = array[0..array.length/2 - 1]
  right = array[array.length/2..-1]
  sorted_left = merge_sort(left)
  sorted_right = merge_sort(right)
  sorted_array = []
  #Rejoin the things
  while !sorted_left.empty? && !sorted_right.empty?
    if sorted_left[0] < sorted_right[0]
      sorted_array << sorted_left.shift
    else
      sorted_array << sorted_right.shift
    end
  end
  sorted_left.empty? ? sorted_array.concat(sorted_right) : sorted_array.concat(sorted_left)

  sorted_array
end

def subsets(array)
  return [[]] if array.empty?
  smaller_subsets = subsets(array[1..-1])
  all_subsets = []
  smaller_subsets.each do |set|
    all_subsets << set.dup
    all_subsets << set.concat([array[0]])
  end
  all_subsets
end
