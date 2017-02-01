require 'byebug'
def substrings(string)
  substring = []
  debugger
  string.each_char.with_index do |char, index|
    substring << char
    index2 = index + 1
    while index2< string.length
      substring << string[index..index2]
      index2 +=1
    end
  end
  substring
end

def subwords(word, dictionary)
  debugger
  substrings[word]
  substrs = substrings[word]
  words = []
  substrs.each do |substr|
    if dictionary.include?(substr)
      words << substr
    end
  end
  words
end

subwords("hello", ["h", "e"])
