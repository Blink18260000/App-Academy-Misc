require 'benchmark'

#Brute force: O(n^2)
def two_sum?(arr, target_sum)

  arr.each_with_index do |el, idx|
    arr.each_with_index do |el2, idx2|
      return true if el + el2 == target_sum && idx != idx2
    end
  end
  false
end

#time complexity of O(nlogn)
def okay_two_sum?(arr, target_sum)
  sorted = arr.sort

  sorted.each_with_index do |el, idx|
    found_idx = sorted.my_bsearch(target_sum - el)
    return true if !found_idx.nil? && found_idx != idx
  end

  false
end

class Array

  def my_bsearch(target)
    return nil if self.length <= 1 && self[0] != target
    middle = self.length / 2
    return middle if self[middle] == target
    left, right = self[0...middle], self[middle + 1 ... self.size]
    if self[middle] < target
      return left.my_bsearch(target)
    else
      result = right.my_bsearch(target)
      if result.nil?
        return nil
      else
        return result + 1 + left.size
      end
    end
  end

end

#hash map: time complexity is O(n)
def hash_two_sum?(arr, target_sum)
  my_hash = {}

  arr.each do |el|
    return true if my_hash.has_key?(target_sum-el)
    my_hash[el] = true
  end

  false
end

#???????????
def hash_n_sum?(n, arr, target_sum)
  my_hash = {}
  return hash_two_sum?(arr, target_sum) if n == 2
  arr.each_with_index do |el, idx|
    return true if hash_n_sum?(n-1, arr[0...idx]+ arr[idx+1..-1], target_sum - el)
    my_hash[el] = true
  end

  false
end

Benchmark.bm do |b|
  arr = Array.new(100) { rand(1..100) }
  sum_two = b.report("n = 2 :  ") { hash_n_sum?(2, arr, 50) }
  sum_three = b.report("n = 3 :  ") { hash_n_sum?(3, arr, 50) }
  sum_t = b.report("n = 4 :  ") { hash_n_sum?(4, arr, 50) }
  sum_h = b.report("n = 5 :  ") { hash_n_sum?(5, arr, 50) }
  sum_p = b.report("n = 6 :  ") { hash_n_sum?(6, arr, 50) }
  sum_k = b.report("n = 7 :  ") { hash_n_sum?(7, arr, 50) }
  sum_v = b.report("n = 8 :  ") { hash_n_sum?(8, arr, 50) }
  sum_w = b.report("n = 9 :  ") { hash_n_sum?(9, arr, 50) }
end
