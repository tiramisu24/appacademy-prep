class Temperature
  attr_accessor :c, :f
  def initialize(temp = {})
    if temp.key?(:c)
      @c = temp[:c]
    elsif temp.key?(:f)
      @f = temp[:f]
    end
  end

  def self.from_celsius(temp)
    self.new(c: temp)
  end
  def self.from_fahrenheit(temp)
    self.new(f: temp)
  end

  def in_celsius
    if @c != nil
      return @c
    elsif @f != nil
      return (@f - 32)*5.0/9.0
    else
      return nil
    end
  end

  def in_fahrenheit
    if @c != nil
      return @c*9.0/5 + 32
    elsif @f != nil
      return @f
    else
      return nil
    end
  end
end

class Celsius < Temperature
  attr_accessor :c
  def initialize(temp)
    @c = temp
  end
end

class Fahrenheit < Temperature
  attr_accessor :f
  def initialize(temp)
    @f = temp
  end

end
