def echo(sentence)
    words = sentence.split
    echo_word = words[-1]
    echo_word

end

def shout(sentence)
    sentence.upcase!
end

def repeat(word, count =2)
    repeated_words = word
    (count-1).times do
        repeated_words += " #{word}"
        repeated_words
    end
    repeated_words
end

def start_of_word(word, count)
    beginning = word[0...count]

end

def first_word(sentence)
    words = sentence.split
    words[0]
end

def titleize (sentence)
    words = sentence.split
    new_title = words.shift.capitalize!
    words.each do |word|
        #listed out all the cases of little word...
        unless word == "the" || word =="a" || word=="and" || word =="over" || word.capitalize!
        end
        new_title += " #{word}"

    end
    new_title

end
