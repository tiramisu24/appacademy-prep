class Fixnum
  ONES = {
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }

  TEENS = {
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen"
  }

  TENS = {
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }

  BIG_FIGURES = {
    1000 => "thousand",
    1000000 => "million",
    1000000000 => "billion",
    1000000000000 => "trillion"
  }

  require "byebug"
  def in_words
    return "zero" if self == 0
    num = self
    words = []
    BIG_FIGURES.keys.reverse.each do |key|
      words << add_nums(num,key, BIG_FIGURES[key])
    end

    words << hundreds(num%1000) if num >=100
    words << tens(num%100)

    words.flatten.compact.join(" ")
  end

  def add_nums(num,magnitude, magnitude_word)
    words = []
    if num >= magnitude
          number = big_nums(num%(magnitude*1000), magnitude)
          words << number
          words << magnitude_word if number != nil
    end
    words
  end

  def tens(num)
    word = []
    rem = num % 10
    if num < 10
      word = ONES[num]
    elsif num <20
      word = TEENS[num]
    elsif num >= 20
      word << TENS[num - rem]
      if rem != 0
        word << ONES[rem]
      end
    end
    word
  end

  def hundreds(num)
    rem = (num/100).to_i
    word = []
    if rem != 0
      word << ONES[rem]
      word << "hundred"
    end
  end

  def big_nums(num, value)
    rem = (num/value).to_i
    return nil if rem ==0
    word = []
    if rem >= 100
      word << hundreds(rem)
      word << tens(rem%100)
    else
      word << tens(rem)
    end
    word
  end
end
