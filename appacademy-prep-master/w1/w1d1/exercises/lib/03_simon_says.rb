require 'byebug'
def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word, rep =2)
  rep_phrase = String.new
  rep_phrase << word
  (rep-1).times do
    rep_phrase << " " + word
  end
  rep_phrase
end

def start_of_word(word, num)
  word[0...num]
end

def first_word(sentence)
  sentence.split(" ").first
end

def titleize(title)
  exclude = ["and", "the", "over"]
  words = title.split(" ")
  words[0].capitalize!
  words[1..words.length].each do |word|
    unless exclude.include?(word)
      word.capitalize!
    end
  end
  words.join(" ")
end
