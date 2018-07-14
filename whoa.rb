puts 'before'
puts $LOAD_PATH

require "artii"

puts 'after'
puts $LOAD_PATH

arter = Artii::Base.new

puts arter.asciify("whoa")
