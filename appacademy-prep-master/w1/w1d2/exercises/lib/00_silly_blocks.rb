def reverser
  sentence = yield.split
  output = []
  sentence.each do |word|
    output << word.reverse
  end
  output.join(" ")
end

def adder(add = 1)
  num = yield
  num += add
end

def repeater (num=1, &proc)
  num.times &proc
end
