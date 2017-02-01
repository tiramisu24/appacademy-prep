

def word_unscrambler(str, words)
    str_sort = unscramble(str)
    unscrambled_words = []
    words.each do |entry|
        new_word = unscramble(entry)
        if str_sort==new_word
            unscrambled_words.push(entry)
        end
    end

    unscrambled_words
end

def unscramble (word)
    word_alpha =word.split("")
    word_alpha.sort!
    new_word = word_alpha.join
    new_word  

end


