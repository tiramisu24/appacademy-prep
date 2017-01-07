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
    puts word
    rep_phrase << " " + word
    puts "+++++"
    puts rep_phrase
  end
  rep_phrase
end
