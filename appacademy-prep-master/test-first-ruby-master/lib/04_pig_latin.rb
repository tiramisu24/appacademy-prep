def translate(sentence)
    words = sentence.split
    new_sentence=""
    words.each do |word|

        new_word = pig_latine(word)
        if word != words[0]
            new_sentence += " "
        end
        
        new_sentence += new_word
    end

    new_sentence

end

def pig_latine(word)
        while TRUE
            letter = word[0]
             if letter == 'a' || letter == 'e' || letter == 'i'|| letter == 'o'|| letter == 'u'    
                 break

             elsif letter == 'q'
                if word[1] =='u'
                    word = word[2...word.length] + word [0..1]
                end
             elsif letter == 's'
                 if word[1] == 'c' && word[2] =='h'
                    word = word[3...word.length] + word [0..2]
                 end
             else
                 word = word[1..word.length] + word[0]
             end

        end
        
        word +="ay"
        word
end

