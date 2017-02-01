class Temperature
    def initialize(*input)
        temp=input[0]
        #assume that only one temperature will be passed in. 
        #assume only :f or :c passed in
        if temp.has_key?(:f)
            @fahrenheit = temp[:f]
            ftoc
            
        else
            @celsius = temp[:c]
            ctof
        end
    
    end
    
    def ftoc
       @celsius = (@fahrenheit-32)*5.0/9.0 
    end

    def ctof
        @fahrenheit = (@celsius)*9.0/5.0 + 32
    end

    def in_fahrenheit
        @fahrenheit
    end

    def in_celsius
        @celsius
    end

    def self.from_celsius(temp)
        Temperature.new({c: temp})
    end

    def self.from_fahrenheit(temp)
        Temperature.new({f: temp})
    end


end

class Celsius < Temperature
    def initialize(temp)
        @celsius= temp
    end


    def in_fahrenheit
       ctof
    end
end
class Fahrenheit < Temperature
    def initialize(temp)
        @fahrenheit= temp
    end


    def in_celsius
       ftoc
    end
end
