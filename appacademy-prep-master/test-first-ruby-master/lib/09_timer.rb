class Timer
    attr_writer :seconds
    def seconds
        @seconds = 0
    end

    def time_string
        #assumes valid time passed in (no fractions/decimals)
        min =0
        sec = 0
        hour =0

        if (@seconds/60) <1
            sec = @seconds
        elsif (@seconds/3600)<1
            min = (@seconds/60).to_i
            sec = @seconds%60
        else
            hour = (@seconds/3600).to_i
            temp = @seconds-hour*3600
            min =(temp/60).to_i
            sec=temp%60
        end

        sec_string = help_to_string(sec)
        min_string = help_to_string(min)
        hour_string = help_to_string(hour)

        return "#{hour_string}:#{min_string}:#{sec_string}"
    end

    def help_to_string(num)
        if num<10
            return "0#{num}"
        else
            return num.to_s
        end
    end

end
