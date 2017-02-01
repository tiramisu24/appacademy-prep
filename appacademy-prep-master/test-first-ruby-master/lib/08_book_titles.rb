class Book
  # I am going to assume all cases of capitalization rules were included in the
  # test methods...
  attr_accessor :title
    def initialize
        @title = ""    
    end
    def title=(title)
        @title = capitalize(title)

    end

    def capitalize (title)
        words = title.split
        new_title = words.shift.capitalize
        words.each do |word|
            unless word == "the" || word =="a" || word=="an" || word=="and" || word =="in" ||word=="of" 
                new_title += " #{word.capitalize}"
            else
                new_title += " #{word}"
            end
        end

        new_title
    end
end


