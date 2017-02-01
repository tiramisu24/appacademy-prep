def ordered_vowel_words(str)
    words = str.split(" ")
    new_str =[]
    words.each do |word|
        if is_ordered?(word)
            new_str.push(word)
        end
    end
    return new_str.join(" ")

end

def is_ordered?(word)
    char = ["a", "e", "i", "o", "u"]
    word = word.lowercase
    char_list = []

    word.each_char do |c|
        if char.include?(c)
            char_list.push(c)
        end
    end
    
    return char_list == char_list.sort
    
end
