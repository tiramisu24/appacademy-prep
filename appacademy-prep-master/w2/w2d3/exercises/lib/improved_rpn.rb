require_relative "/Users/diane/Documents/AppAcad/appacademy-prep-master/w2/w2d1/exercises/lib/00_rpn_calculator"
require "byebug"
class RPNCalculator
  def self.read_file(file)
    entries = file.readlines
    entries.each do |line|
      calc = RPNCalculator.new
      puts calc.evaluate(line.chomp)
    end
  end

  def self.user_input
    debugger
    rpn = RPNCalculator.new
    calc = ""
    while true do
      "Input number or operator. ENTER to quit"
      input = gets.chomp
      break if input == ""
      calc << input
    end
    puts rpn.evaluate(calc)
  end

end
if __FILE__ == $PROGRAM_NAME
  debugger
  if ARGV.empty?
    RPNCalculator.user_input
  else
    File.open(ARGV[0]) do |file|
      puts RPNCalculator.read_file(file)
    end
  end
end
