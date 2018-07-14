receiver = "foo"

def receiver.message
    "Hi, thanks for you message and here's the return value.";
end

puts "puts receiver"
puts receiver
puts "puts receiver.message"
puts receiver.message
puts "puts receiver.class"
puts receiver.class

puts "'Object' methods"
puts "puts receiver.methods - receiver.class.instance_methods"
puts receiver.methods - receiver.class.instance_methods

puts receiver.to_i.class
puts receiver.to_r.class
puts receiver.to_c.class
puts receiver.to_f.class

puts "puts receiver.class.class"
puts receiver.class.class
