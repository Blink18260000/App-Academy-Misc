# We're going to implement a cipher called the Folding Cipher. Why? Because it
# folds the alphabet in half and uses the adjacent letter.
#
# For example,
# a <=> z
# b <=> y
# c <=> x
# ...
# m <=> n

def folding_cipher(str)
  letters = str.split("")

  alphabet = []
  ("a".."z"),to_a.each { |l| alphabet << l }

  folded_alphabet = {}
  alphabet.each_with_index do |letter, index|
    folded_alphabet[letter] = -(index + 1)
  end

  letters.map { |letter| folded_alphabet[letter] }.join("")
end

# Write a function, `fibs(num)` which returns the first `num` elements from the
# Fibonnacci sequence. The sequence starts with [0, 1], and each subsequent
# number is the sum of the two previous numbers.

def fibs(num)
  return false if num < 1
  fibs = [0, 1]

  while fibs.length = num


end

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

def jumble_sort(str, alphabet = nil)
  letters = str.split("")
  return letters.sort.join("") if alphabet == nil

  alphabet_hash = {}
  alphabet.each_with_index do |letter, index|
    alphabet_hash[letter] = index
  end

  letters.sort_by {|letter| alphabet_hash[letter]}.join("")


end

class Array
  # Write an array method that returns `true` if the array has duplicated
  # values and `false` if it does not
  def dups?
    uniques = self.unique
    if (self.length - uniques.length) > 0
      return true
    else
      return false
    end
  end
end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
end
