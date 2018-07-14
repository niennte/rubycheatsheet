puts self
puts self.class

foo = ""
bar = ""

def foo.message
    'foo message'
end

puts foo.message

class String
    def message
        'string message'
    end
end

puts foo.message
puts bar.message
puts "".message


class String
    remove_method :message
end

puts foo.message
puts bar.respond_to? :message
