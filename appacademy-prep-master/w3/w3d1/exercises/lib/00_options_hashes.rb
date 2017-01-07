# Options Hashes
#
# Write a method `transmogrify` that takes a `String`. This method should
# take optional parameters `:times`, `:upcase`, and `:reverse`. Hard-code
# reasonable defaults in a `defaults` hash defined in the `transmogrify`
# method. Use `Hash#merge` to combine the defaults with any optional
# parameters passed by the user. Do not modify the incoming options
# hash. For example:
#
# ```ruby
# transmogrify("Hello")                                    #=> "Hello"
# transmogrify("Hello", :times => 3)                       #=> "HelloHelloHello"
# transmogrify("Hello", :upcase => true)                   #=> "HELLO"
# transmogrify("Hello", :upcase => true, :reverse => true) #=> "OLLEH"
#
# options = {}
# transmogrify("hello", options)
# # options shouldn't change.
# ```
require "byebug"
def transmogrify(str, options = {})
  default = { times: 1, upcase: false, reverse: false}
  options = default.merge(options)
  # debugger
  new_str = [str]
  (options[:times]-1).times do |num|
    new_str << str
  end
  new_str = new_str.join()
  if options[:upcase]
    new_str.upcase!
  end

  if options[:reverse]
    new_str.reverse!
  end
  # debugger
  new_str
end
