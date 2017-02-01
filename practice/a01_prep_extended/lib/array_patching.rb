require 'byebug'
class Array

  def my_each(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx])
      idx +=1
    end
    self
  end

  def my_each_with_index(&prc)
    idx = 0
    while idx < self.length
      prc.call(self[idx],idx)
      idx +=1
    end
    self
  end

  def my_select(&prc)
    arr = []
    self.each do |el|
      arr << el if prc.call(el)
    end
    arr
  end

  def my_reject(&prc)
    arr = []
    self.each { |el| arr << el unless prc.call(el)}
    arr

  end

  def my_any?(&prc)
    self.each do |el|
      return true if prc.call(el)
    end
    false
  end

  def my_all?(&prc)
    self.each { |el| return false unless prc.call(el)}
    true
  end

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    # return self unless self.is_a?(Array)
    new_arr = []
    self.each do |el|
      if el.is_a?(Array)
        new_arr += el.my_flatten
      else
        new_arr << el
      end
    end
    new_arr
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n == 0
    new_arr = []
    self.each do |el|
      if el.is_a? (Array)
        new_arr += el.my_controlled_flatten(n-1)
      else
        new_arr << el
      end
    end
    new_arr
  end

  def my_zip(*arrs)
    new_arr = Array.new(self.length()){Array.new}
    self.each_with_index do |el, idx|
        new_arr[idx]<<self[idx]
        arrs.each do |arr|
          new_arr[idx] << arr[idx]
        end
    end
    new_arr
  end

  def my_rotate(num=1)
    str = self.dup
    abs = num if num > 0
    abs = -num if num < 0
    abs.times do
      if num > 0
        str = str.drop(1) + str.take(1)
      else
        front = str.pop
        str = [front]+ str
      end
    end
    str
  end

  def my_join(str = "")
    new_str = ""
    # last = self.last
    self.each do |string|
      new_str += string
      new_str += str if string != self.last
    end
    new_str
  end

  def my_reverse
    new_str = self.dup
    idx = 0
    len= self.length
    while idx < self.length()/2
      new_str[idx] , new_str[len-(idx+1)] = new_str[len-(idx+1)] ,new_str[idx]
      idx +=1
    end
    new_str
  end

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)
    prc ||= Proc.new{|a,b| a <=> b}
    return self if self.length <= 1
    mdix = self.length()/2
    left = []
    right = []
    # debugger
    self.each_with_index do |item, idx|
      case prc.call(item,self[mdix])
      when -1 #a smaller
        left << item
      when 0
        left << item if idx != mdix
      when 1
        right << item
      end
    end
    # debugger
    left.my_quick_sort(&prc) + [self[mdix]] + right.my_quick_sort(&prc)
  end

  # Write a monkey patch of binary search that accepts a comparison block:
  # E.g. [1, 2, 3, 4, 5, 7].my_bsearch(6) {|el, targ| el+1 <=> targ} => 4
  def my_bsearch(target, &prc)
    return nil if self.length == 0
    return nil if self.length == 1 && self.first != target
    midx = self.length/2
    prc ||= Proc.new{|a,b| a<=>b}
    # debugger
    case prc.call( target, self[midx])
    when -1
      self[0...midx].my_bsearch(target, &prc)
    when 0
      return midx
    when 1
      result = self[midx..-1].my_bsearch(target, &prc)
      (result.nil?)? nil : self[0...midx].length + result
    end
  end

end
