def add(par1, par2)
  par1 + par2
end

def subtract(par1, par2)
  par1 - par2
end

def sum(arr)
  sum = 0
  arr.each {|num| sum += num }
  sum
end

def multiply (num1, *args)
  result = num1
  args.each { |num| result *= num}
  result
end

def power(num,power)
  num**power
end

def factorial(num)
  fact = 1
  count = 1
  num.times do
    fact *= count
    count +=1
  end
  fact
end
