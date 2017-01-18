class Timer
  attr_accessor :seconds
  def initialize
    @seconds = 0
  end

  def time_string
    time = []
    sec = @seconds
    3.times do
      value = sec % 60
      num_str = ""
      if value < 10
        num_str = "0" + value.to_s
      else
        num_str = value.to_s
      end
      time.unshift(num_str)
      sec = (sec - value)/60
    end
    time.join(":")
  end

end
