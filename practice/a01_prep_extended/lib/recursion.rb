require "byebug"

class RecursionMachine

  # Implement a method that finds the sum of the first n
  # fibonacci numbers recursively. Assume n > 0
  def fibs_sum(n)
    sum_fibs =  0
    count = 1
    while count <= n
      sum_fibs += find_fib(count)
      count +=1
    end
    sum_fibs

  end

  def find_fib(n)
    return 0 if n < 0
    return 1 if n <= 2
    find_fib(n-1) + find_fib(n-2)
  end

  #returns all subsets of an array
  def subsets(array)
    return [array] if array.length == 0
    # return [array] if array.length == 1

    subs = []
    array.each_with_index do |el, idx|
      subs += subsets(array[0...idx] + array[idx+1 ..-1])
      subs << array
    end
    subs.uniq
  end


  # return the sum of the first n even numbers recursively. Assume n > 0
  def first_even_numbers_sum(n)
    return 0 if n <= 0
    2*n + first_even_numbers_sum(n-1)
  end

  # return b^n recursively. Your solution should accept negative values
  # for n
  def exponent(b, n)
    return 1 if n == 0

    (n > 0) ? b * exponent(b, (n-1)) : exponent(b,(n+1)).to_f/b
  end

  # make better change problem from class
  def make_better_change(value, coins)
    coins
  end

  #deep dup question from class
  def deep_dup(arr)
    return arr if !arr.is_a?(Array)
    dup =[]
    arr.each do |el|
      dup << deep_dup(el)
    end
    dup
  end

  # Write a recursive method that takes in a string to search and a key string.
  # Return true if the string contains all of the characters in the key
  # in the same order that they appear in the key.
  #
  # string_include_key?("cadbpc", "abc") => true
  # string_include_key("cba", "abc") => false
  def string_include_key?(string, key)


  end

  # Write a recursive function that returns the prime factorization of
  # a given number. Assume num > 1
  #
  # prime_factorization(12) => [2,2,3]
  def prime_factorization(num)
    return [] if num < 2
    return [num] if is_prime?(num)
    arr = []
    (2...num).to_a.each do |el|
      if (num%el == 0) && is_prime?(el)
        arr += prime_factorization(num/el)
      end
    end
    arr
  end

  def is_prime?(num)
    (2...num).to_a.each{ |el| return false if num%el == 0}
    true
  end

  # Write a method, `digital_root(num)`. It should Sum the digits of a positive
  # integer. If it is greater than 10, sum the digits of the resulting number.
  # Keep repeating until there is only one digit in the result, called the
  # "digital root". **Do not use string conversion within your method.**
  #
  # You may wish to use a helper function, `digital_root_step(num)` which performs
  # one step of the process.

  # def digital_root(num)
  #
  # end

  # Write a recursive method that takes in a base 10 number n and
  # converts it to a base b number. Return the new number as a string
  #
  # E.g. base_converter(5, 2) == "101"
  # base_converter(31, 16) == "1f"
  CHARS = ("a".."z").to_a
  def base_converter(num, b)
    #base 10 to base n
    return num.to_s if num < b
    new_num = ""
    num_str = (num%b < 10)? (num%b).to_s : over_ten(num%b,b)

    new_num += base_converter(num/b, b) + num_str
    new_num
  end
  def over_ten(num,b)
    chars = CHARS.take(b-9)
    str = ""
    str += chars[num-10]
  end

  # CHALLENGE: Eight queens puzzle precursor
  #
  # Write a recursive method that generates all 8! possible unique ways to
  # place eight queens on a chess board such that no two queens are in
  # the same board row or column (the same diagonal is OK).
  #
  # Each of the 8! elements in the return array should be an array of positions:
  # E.g. [[0,0], [1,1], [2,2], [3,3], [4,4], [5,5], [6,6], [7,7]]
  #
  # My solution used 3 method parameters: current_row, taken_columns, and
  # positions so far
  def eight_queens_possibilities(current_row, taken_columns, positions)

  end

end
