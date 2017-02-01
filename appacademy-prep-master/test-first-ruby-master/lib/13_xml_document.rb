class XmlDocument
    def initialize(indent = FALSE)
        @indent = indent
        @indent_num = 0
    end

    def method_missing(name = "hello", *args, &block)
        attr = args[0]
        xml = ""   
        xml += ("  " * @indent_num)  if @indent
        
        xml = "<#{name}"
        if attr != nil
            attr.each_pair do |key,value|
                xml += " #{key}=\"#{value}\""
            end
            
            if block_given?
                @indent_num -=1
            end
            
        end
        
        if block_given?
            xml += ">"
            xml += "\n" if @indent 
            @indent_num +=1
            
            xml += ("  " * @indent_num)  if @indent

            xml += yield 

            @indent_num -=1


            xml += ("  " * @indent_num)  if @indent
            xml += "</#{name}>"

        else
            xml += "/>"
        end

        xml += "\n" if @indent 

        xml
    end

        
end
