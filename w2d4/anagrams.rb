#anagram I: time complexity is O(n^3)
def first_anagram?(str1, str2)
  anagram_list = anagrammer(str1)
  return true if anagram_list.include?(str2)
  false
end

def anagrammer(str)
  return str if str.length == 1
  anagrams = str.split(//).permutation.to_a
  anagrams.map { |chr_ary| chr_ary.join("") }
end

#anagram II: time complexity of O(n^2)
def second_anagram?(str1, str2)
  str1_array = str1.split("")
  str2_array = str2.split("")

  str1_array.each_with_index do |letter1, idx1|
    str2_array.each_with_index do |letter2, idx2|
      if letter1 == letter2
        str1_array[idx1] = nil
        str2_array[idx2] = nil
      end
    end
  end
  return true if str1_array.join == "" && str2_array.join == ""
  false
end

#anagram III: time complexity of O(n)
def third_anagram?(str1, str2)
  str1, str2 = str1.downcase, str2.downcase
  return true if str1.split(//).sort == str2.split(//).sort
  false
end

#anagram the fourth: time complexity of O(n)
def fourth_anagram(str1, str2)
  return false unless str1.size == str2.size

  letter_hash1 = Hash.new{ |h, k| h[k] = 0 }

  str1.size.times do |idx|
    letter_hash1[str1[idx]] += 1
    letter_hash1[str2[idx]] -= 1
  end

  letter_hash1.each_value do |v|
    return false unless v == 0
  end
  true
end

#same as above, but better
def amazing_anagram?(str1, str2)
  return false unless str1.size == str2.size
  str1 = str1.split(//)
  str2 = str2.split(//)

  return true if str1 | str2 == str1
  false
end
