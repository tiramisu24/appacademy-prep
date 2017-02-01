class RPNCalculator
    attr_accessor:rpn
    def initialize
        @rpn=Array.new
    end

    def push(num)
        rpn.push(num)
    end

    def plus
        raise Exception.new("calculator is empty") if rpn.length <2
        rpn.push(:+)
    end

    def minus
        raise Exception.new("calculator is empty") if rpn.length <2
        rpn.push(:-)
    end

    def divide
        raise Exception.new("calculator is empty") if rpn.length <2
        rpn.push(:/)
    end

    def times
        raise Exception.new("calculator is empty") if rpn.length <2
        rpn.push(:*)
    end

    def value
        value1 = nil
        value2 = nil
        
        index = 0
        while index < rpn.length
            value = rpn[index]
            case value
            when :+
               temp=rpn[index-2] + rpn[index-1]
            when :- 
               temp=rpn[index-2] - rpn[index-1]
            when :/
               temp=(rpn[index-2]).to_f / rpn[index-1]
            when :*
               temp=rpn[index-2] * rpn[index-1]          
            else
                index +=1
                next
            end
            
            rpn.delete_at(index-2)
            rpn.delete_at(index-2)
            rpn[index-2] = temp
            index -= 2
        end
        rpn[-1]

    end
    
    def tokens(string)
        values = string.split(" ")
        rpn_array = Array.new

        values.each do |value|
            case value
            when "*"
                rpn_array.push(:*)
            when "/"
                rpn_array.push(:/)
            when "+"
                 rpn_array.push(:+)
            when "-"
                 rpn_array.push(:-)
            else
                 rpn_array.push(value.to_i)
            end

        end

        rpn_array
    end

    def evaluate(string)
        @rpn= tokens(string)
        value

    end


end


