fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

#n2
def sluggish(fish)
  fish.each_with_index do |el,idx|
    idx2 = idx + 1
    while idx2 < fish.length
      if el.length > fish[idx2].length
        fish[idx], fish[idx2] = fish[idx2], fish[idx]
      end
      idx2 +=1
    end
  end
  fish.last
end

#nlogn
def dominant(fish)
  return fish if fish.length <= 1
  mid_idx = fish.length / 2
  merge( dominant(fish.take(mid_idx)), dominant(fish.drop(mid_idx)))
end

def merge(left, right)
  merged_array = []
  prc = Proc.new { |num1, num2| num1 <=> num2 }
  until left.empty? || right.empty?
    case prc.call(left.first.length, right.first.length)
    when -1
      merged_array << left.shift
    when 0
      merged_array << left.shift
    when 1
      merged_array << right.shift
    end
  end

  merged_array + left + right
end

#n
def clever(fish)
  biggest = ""
  fish.each do |el|
    if el.length > biggest.length
      biggest = el
    end
  end
  biggest
end

#n
def slow_dance(step,arr)
  arr.each_with_index do |el, idx|
    return idx if el == step
  end
  nil
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]
# puts slow_dance("up", tiles_array)
#
#
# puts slow_dance("right-down", tiles_array)

def constant_dance(tiles_array)
  hash = {}
  tiles_array.each_with_index do |el,idx|
    hash[el] = idx
  end
  hash
end

def fast_dance(step, hash)
  hash["right-down"]
end

puts fast_dance("right-down",constant_dance(tiles_array))
