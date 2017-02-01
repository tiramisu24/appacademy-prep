# my_map = [[k1, v1], [k2, v2], [k3, v2], ...].
#
# Our Map class should have the following instance methods: assign(key, value), lookup(key), remove(key),

class Map
  def initialize
    @map = [[]]
  end

  def assign(key,value)
    @map << [key,value] if lookup(key).nil?
  end

  def lookup(key)
    @map.each {|pair| return value if pair[0] == key}
    nil
  end

  def remove(key)
    value = lookup(key)
    @map.delete([key,value]) unless value.nil?
    [key,value]
  end



end
