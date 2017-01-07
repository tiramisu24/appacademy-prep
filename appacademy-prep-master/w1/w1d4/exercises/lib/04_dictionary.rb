require "byebug"
class Dictionary
  attr_reader :dict
  def initialize
    @dict = {}
  end

  def entries
    @dict
  end

  def keywords
    @dict.keys.sort
  end

  def add(entry)
    if entry.is_a?(String)
      @dict[entry] = nil
    else
      @dict = @dict.merge(entry)
    end
  end

  def include?(keyword)
    keywords.include?(keyword)
  end

  def find(keyword)
    if include?(keyword)
      return {keyword => @dict[keyword]}
    elsif find_suffix(keyword) != nil
      return find_suffix(keyword)
    else
      return {}
    end
  end

  def find_suffix (suff)
    len = suff.length
    find = {}
    keywords.each do |keyword|
      if suff == keyword[0...len]
        find[keyword] = @dict[keyword]
      end
    end
    return find
  end

  def printable
    str= ""
    # debugger
    keywords.each do |word|
      str += "[#{word}] \"#{@dict[word]}\""
      if word != keywords.last
        str += "\n"
      end
    end
    str
  end

end
