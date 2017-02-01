def add(num1, num2)
    num1 + num2
end

def subtract(num1, num2)
    num1 - num2
end

def sum(num_list)
    #total = nil... doesn't this make more sense if the array is empty? 

    total = 0
    num_list.each do |num|
        total += num
    end
    total
end

def multiply(num_list)
    #assume numbers are passed in as a list
    total = 1
    num_list.each do |num|
        total *= num
    end
    total

end

def power(num1, num2)
    #raise num1 to the power of num2
    if num2 == 0
        return 1
    else
        (num1**num2).to_f
    end
    
end

def factorial(num)
    #assume no decimals and negative numbers. If has negative, will simply test
    #for negative, use the same code and stick the negative back at the end
    #using 0-num
    if num <1
        return 0
    end
    total = 1
    count = num
    while count > 0
        total *= count       
        count -=1
    end
    total
end
