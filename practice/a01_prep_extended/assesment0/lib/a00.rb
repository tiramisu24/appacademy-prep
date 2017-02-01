# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.
require 'byebug'
CHARS = ("a".."z").to_a
def caesar_cipher(str, shift)
  code = []
  a = "a".ord
  z = "z".ord
  str.split("").each do |char|
    if char == " "
      code << char
    elsif char.ord + shift < z
      code << (char.ord + shift).chr
    else
      code << (a + (char.ord) + shift - z -1).chr
    end

  end
  code.join("")


end

# Write a method, `digital_root(num)`. It should Sum the digits of a positive
# integer. If it is greater than 10, sum the digits of the resulting number.
# Keep repeating until there is only one digit in the result, called the
# "digital root". **Do not use string conversion within your method.**
#
# You may wish to use a helper function, `digital_root_step(num)` which performs
# one step of the process.

def digital_root(num)
  until num < 10
    num = root_sum(num)
  end
  num
end

def root_sum(num)
  sum = 0
  while num > 0
    sum += num%10
    num /=10
  end
  sum
end
# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  alphabet ||= ("a".."z").to_a
  new_str = []
  dup = str.dup.split("")
  alphabet.each do |let|
    dup.each do |char|
      new_str << char if char == let
    end

  end
  new_str.join("")
end

class Array
  # Write a method, `Array#two_sum`, that finds all pairs of positions where the
  # elements at those positions sum to zero.

  # NB: ordering matters. I want each of the pairs to be sorted smaller index
  # before bigger index. I want the array of pairs to be sorted
  # "dictionary-wise":
  #   [0, 2] before [1, 2] (smaller first elements come first)
  #   [0, 1] before [0, 2] (then smaller second elements come first)

  def two_sum
    zeros = []
    self.each_with_index do |num, idx|
      idx2 = idx + 1
      while idx2 < self.length
        if self[idx] + self[idx2] == 0
          zeros << [idx,idx2]
        end
        idx2 +=1
      end
    end
    zeros

  end
end

class String
  def real_words_in_string(dict)
    words = []
    self.split("").each_with_index do |el, idx|
      idx2 = idx
      # debugger
      while idx2 < self.length
        words << self[idx..idx2] if dict.include?(self[idx..idx2])
        idx2 +=1
      end
    end
    words.uniq
  end
end

# Write a method that returns the factors of a number in ascending order.

def factors(num)
  fact = []
  (1..num).to_a.each do |n|
    if num%n ==0
      fact << n
    end
  end
  fact
end
