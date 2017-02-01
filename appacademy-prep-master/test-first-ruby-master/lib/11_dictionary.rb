class Dictionary
    attr_reader :entries
    def initialize
        @entries = {}
    end

    def add(entry)
        #assume only one key added each time
        if entry.is_a? Hash
            entry_key = entry.keys[0]
            entry_value = entry.values[0]     
        else
            entry_key = entry
            entry_value = nil
        end
        @entries[entry_key] = entry_value
    end
    def keywords
        @entries = @entries.sort.to_h
        @entries.keys
    end

    def include?(entry)
        keys = keywords
        keys.each do |key|
            if entry == key
                return TRUE 
            end
        end
        return FALSE 
    end

    def find(entry)
        words = {}
        if include?(entry)==TRUE
           words[entry] = @entries[entry]
            return words
        else
            keys = keywords
            keys.each do |key|
                if entry == key[0...(entry.length)]
                    words[key] = @entries[key]
                end

            end
            return words
        end
    end

    def printable
        keys = keywords
        last_key = keywords[-1]
        print = ""
        keys.each do |key|
            temp = "[#{key}] \"#{entries[key]}\""
            if key != last_key
                temp += "\n"
            end
            print += temp

        end
        print
    end



end
