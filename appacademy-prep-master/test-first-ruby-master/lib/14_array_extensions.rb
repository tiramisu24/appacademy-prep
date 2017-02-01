class Array
    
    def sum
        sum = 0
        arr = self
        arr.each do |num|
            sum += num
        end
        sum
    end

    def square
        arr =self
        new_arr = []
        arr.each do |num|
            new_arr.push(num**2)
        end
        new_arr
    end

    def square!
        arr = self
        index = 0
        while index < arr.length

            arr[index] *= arr[index]

            index +=1
        end
        arr
    end
end
