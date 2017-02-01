require "byebug"
class RPNCalculator
  attr_reader :calculator
  def initialize
    @rpn = []
  end

  def push(num)
    @rpn.push(num)
  end

  def plus
    empty?
    last = @rpn.pop
    @rpn[-1] += last
  end

  def minus
    empty?
    last = @rpn.pop
    @rpn[-1] -= last
  end

  def times
    empty?
    last = @rpn.pop.to_f
    @rpn[-1] *= last
  end

  def divide
    empty?
    last = @rpn.pop.to_f
    @rpn[-1] /= last
  end

  def value
    @rpn[-1]
  end

  def tokens(str)
    inputs = str.split(" ")
    output = []
    inputs.each do |input|
      if input.to_i != 0
        output << input.to_i
      else
        output << input.to_sym
      end
    end
    output
  end

  def evaluate(str)
    tokens(str).each do |output|
      case output
      when :+
        plus
      when :-
        minus
      when :*
        times
      when :/
        divide
      else
        push(output)
      end
    end
    value
  end

  def empty?
    raise Exception, "calculator is empty" if @rpn.empty?
  end


end
