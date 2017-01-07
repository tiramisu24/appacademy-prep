def add(par1, par2)
  par1 + par2
end

def subtract(par1, par2)
  par1 - par2
end

def sum(arr)
  sum = 0
  arr.each do |num|
    sum += num
  end
  sum
end

def multiply (num1, *args)
  result = num1
  args.each do |num|
    result *= num
  end

  result
end

def power(num,power)
  num**power
end

def factorial(num)
  # if num <1
  #   return nil
  # end
  fact = 1
  count = 1
  num.times do
    fact *= count
    count +=1
  end
  fact
end
