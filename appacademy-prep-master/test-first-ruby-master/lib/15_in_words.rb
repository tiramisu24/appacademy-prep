class Fixnum

    def in_words()
        #assume no negatives or numbers overflowing to Bignum entered
        num = self
        
        #tens
        arr = tens(num)
        ten = arr[0]
        new_num = arr[1]
       
        #hundreds
        arr = hundreds (new_num)
        hundred = arr[0]
        new_num = arr[1]
        
        #thousands
        arr = thousands (new_num)
        thousand = arr[0]
        new_num = arr[1]
        
        #millions
        arr = millions(new_num)
        million = arr[0]
        new_num = arr[1]

        #billions
        arr = billions(new_num)
        billion = arr[0]
        new_num = arr[1]

       #trillions
        arr = trillions(new_num)
        trillion = arr[0]

        words = trillion + billion + million + thousand + hundred + ten

    end

    def tens(num)
        ten_string = ""
        rem = num%100
        ten =rem 
        if rem >=20 ||  rem <10
            arr = ones(rem)
            one_string = arr[0]
            ten = (arr[1])
        end
        case ten

        when 0
             ten_string =""
             ten = num
        when 10
            ten_string = "ten"
        when 20
            ten_string = "twenty"
        when 30
            ten_string = "thirty"
        when 40
            ten_string = "forty"
        when 50
            ten_string = "fifty"
        when 60
            ten_string = "sixty"
        when 70
            ten_string =  "seventy"
        when 80
            ten_string = "eighty"
        when 90
            ten_string = "ninety"
        when 11
            ten_string = "eleven"
        when 12
            ten_string = "twelve"
        when 13
            ten_string = "thirteen"
        when 14
            ten_string = "fourteen"
        when 15
            ten_string = "fifteen"
        when 16
            ten_string = "sixteen"
        when 17
            ten_string = "seventeen"
        when 18
            ten_string = "eighteen"
        when 19
            ten_string = "nineteen"

        end
        if num>0 && (one_string == "zero" || one_string == nil)
            words = ten_string
        elsif ten_string ==""
            words = one_string
        else
            words = ten_string + " " + one_string            
        end
        if num > 100 && words != ""
            words = " " + words
        end
        [words,(num-rem)]
    end

    def ones(num)
        one = num%10
        case one
        when 0
            one_string = "zero"
        when 1
            one_string =  "one"
        when 2
            one_string =  "two"
        when 3
            one_string =  "three"
        when 4
            one_string =  "four"
        when 5
            one_string =  "five"
        when 6 
            one_string =  "six"
        when 7 
            one_string =  "seven"
        when 8 
            one_string =  "eight"
        when 9 
            one_string =  "nine"
        end

        words = one_string
        num = num - one
        [words, num]
    end

    def hundreds(num)
        hundred = num%1000

        if hundred <99
            
            return ["", num]
        end
        arr = ones(hundred/100)
        ones_digit = arr[0]

        words = ones_digit + " hundred"
        num = num - hundred
        if num > 1000 && words != ""
            words = " " + words
        end
        [words, num]

    end

    def thousands(num)
        above_thousand(num, 1000, "thousand")
    end

    def millions(num)
        above_thousand(num, 1000000, "million")        
    end

    def billions(num)
        above_thousand(num, 1000000000, "billion")
    end

    def trillions(num)
        above_thousand(num, 1000000000000, "trillion")
    end
    def above_thousand(num, unit, word)
        range = num%(1000*unit)
        if range <(unit-1)
           return ["", num]
        end 
        words = ""

        arr_ten = tens(range/unit)
        tens_digit = arr_ten[0]
        ten = range - (arr_ten[1])*unit

        arr_hundred = hundreds(range/unit)
        hundred_digit = arr_hundred[0]
       
        hundred = range - (arr_hundred[1])*unit

        if hundred != 0
            words += hundred_digit 
        end
        if tens_digit != "zero"
            words += tens_digit + " #{word}"
        end

        if num > unit*1000
            words = " " + words
        end
        num = num - range
        [words, num]

    end
end

