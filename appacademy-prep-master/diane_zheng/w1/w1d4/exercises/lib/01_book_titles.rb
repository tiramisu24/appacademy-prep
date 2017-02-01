class Book
  attr_reader :title
  def title=(title)
    noncap = ["a", "the", "and", "an", "in","of"]
    words = title.split(" ")
    temp = []
    words.each_with_index do |word, idx|
      if noncap.include?(word) && idx !=0
        temp << word
      else
        temp << word.capitalize
      end
    end
    @title = temp.join(" ")
  end
end
