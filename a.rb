puts "I want to load some data from b.rb"

local_dir = File.expand_path('../', __FILE__)
$LOAD_PATH.unshift(local_dir)
require "b.rb"

puts B_DATA
