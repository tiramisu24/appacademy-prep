def translate(sentence)
  words = sentence.split
  pig_latin = []
  words.each do |word|
    temp_word = word
    word.each_char do |letter|
      if is_vowel(letter)
        unless letter == 'u' && temp_word[-1] == 'q'
          break
        end
      end
      temp_word = temp_word[1..-1] +temp_word[0]

    end
    temp_word << "ay"
    pig_latin << temp_word
  end
  pig_latin.join(" ")
end

def is_vowel (letter)
  if letter == "a" || letter == "e" || letter == "i" || letter == "o" || letter == "u"
    return true
  end
  return false
end
