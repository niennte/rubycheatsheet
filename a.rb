puts "I want to load some data from b.rb"

puts "But my load path is: #{$LOAD_PATH}"

puts "$ ruby -I . a.rb #will add current directory to load path"

require "b.rb"

puts B_DATA
