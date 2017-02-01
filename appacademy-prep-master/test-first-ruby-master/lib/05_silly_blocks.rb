def reverser
    
    sentence = yield
    words = sentence.split
    new_sentence = ""
    
    words.each do |word|
        if word != words[0]
            new_sentence += " "
        end
        new_sentence += flip_word(word)
    end

    new_sentence
    
    
end

def flip_word(word)
    index = 1
    new_word =""
    while index <= word.length
        letter = word[(word.length) -index]
        new_word += letter
        index +=1
    end
    
    new_word
end

def adder(to_add = 1) 
    value = yield
    
    new_value = value + to_add

end

def repeater(num=0)
    return yield if num ==0

    num.times do 
       yield 
    end

end

