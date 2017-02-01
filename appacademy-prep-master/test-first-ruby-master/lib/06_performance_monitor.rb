require "time"

def measure(num =0)
    repetition =1
    #assuming no more vaiation than doing a block multiple times
    time_now = Time.now
    if num == 0
        yield
    else
        repetition = 0
        num.times do |n|
            yield
            repetition +=1
        end
    end
    time_after = Time.now
    diff_time = time_after - time_now
    
    if diff_time != nil
        diff_time = diff_time/repetition
    end

    diff_time

end


