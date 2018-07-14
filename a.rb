puts "I want to load some data from b.rb"

local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)


# part of bigger kernel object
# calling a message on a object is sending a message (method) to the receiver (object)
# - in this case, receiver is implicit (like global object in php or javascript)
require "b.rb"

puts B_DATA
