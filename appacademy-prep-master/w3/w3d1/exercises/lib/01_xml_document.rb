require "byebug"
class XmlDocument
  attr_accessor :tab, :tab_length
  def initialize (tab=false)
    @tab = tab
    @tab_length = 0
  end

  def method_missing(method_name, *args)
    str = ""
    if block_given?
      str << "<#{method_name}>"
      # debugger
      if @tab
        @tab_length +=1
        str <<"\n"
        str << ("  " * tab_length)
        str << yield
        str << "\n"
        @tab_length -=1
        # debugger
        last_indent = "  " * tab_length
        str << (last_indent)


      else
        str << yield
      end

      str << "</#{method_name}>"


      #no blocks
    elsif args.empty? == false
      if args.first.is_a?(Hash)
        str << "<#{method_name}"
        input = args.first
        str += " #{input.keys.first}="
        str += "\"#{input.values.first}\""
      elsif method_name == send
        str << "<#{args.first}"
      end
      # debugger
      str << "/>"
    else
      # debugger
      str << "<#{method_name}"
      str << "/>"
      # debugger
    end

  end
end
