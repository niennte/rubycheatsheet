# samples: https://medium.freecodecamp.org/six-ruby-array-methods-you-need-to-know-5f81c1e268ce
# docs: https://ruby-doc.org/core-2.5.1/Enumerable.html#method-i-reject

# Array functions and their behaviors
puts '
#map returns array of results, #each returns original array'

array = [1, 2, 3]
puts '
array'
p array

puts '
... putting array through #map (returns new vals)'
mapped_array = array.map {|val| val + 1}

puts '
array'
p array

puts '
mapped_array'
p mapped_array


puts '
... putting array through #each (returns original vals)'
mapped_array = array.each {|val| val + 1}

puts '
array'
p array

puts '
eached_array'
p mapped_array


puts '
However, when the array contains objects, re-assignments'
puts 'done within iterator block will reflect in the original array and all its copies'
puts 'unless deep-copied using copy = var.dup'
puts 'copying an array of objects with .dup will not bubble down to object references within it'

class Event

  attr_accessor :id, :name

  def initialize(id)
    @id = id
    @name = 'default'
  end

end

puts '
... initializing array of Events using map on array (still not affected so far)'
array_of_events = array.map do |val|
  Event.new(val)
end

puts '
array'
p array

puts '
array_of_events'
p array_of_events

array_of_events_deep_copy_using_array = []
array.map do |val|
 array_of_events_deep_copy_using_array[val-1] = array_of_events[val-1].dup
end

puts '
array_of_events_deep_copy_using_array'
p array_of_events_deep_copy_using_array

array_of_events_deep_copy_using_map = array_of_events.map{|e| e.dup}
puts '
array_of_events_deep_copy_using_map'
p array_of_events_deep_copy_using_map

array_of_events_reference_dup_copy = array_of_events.dup
puts '
array_of_events_reference_dup_copy'
p array_of_events_reference_dup_copy




puts '
... assigning a name to each Event within array_of_events by calling map on it (array_of_events is overwritten!)'
mapped_array_of_events = array_of_events.map do |e|
  e.name = "a name"; e
end


puts '
array_of_events'
p array_of_events


puts '
mapped_array_of_events'
p array_of_events


puts '
array_of_events reference_dup_copy'
p array_of_events_reference_dup_copy

puts '
array_of_events_deep_copy_using_map'
p array_of_events_deep_copy_using_map


puts '
array_of_events_deep_copy_using_array'
p array_of_events_deep_copy_using_array




puts '
#select'

array_of_words = ['hello', 'hi', 'bye', 'goodbye']
p array_of_words
selected_array = array_of_words.select{|word| word.length > 3}
puts 'original'
p array_of_words
puts 'returned'
p selected_array

puts '
select example with map'

valid_colors = ['red', 'green', 'blue']
puts 'valid_colors'
p valid_colors
cars = [
{type: 'porsche', color: 'red'},
{type: 'mustang', color: 'orange'},
{type: 'prius', color: 'blue'},
{type: 'nissan', color: 'biege'},
]
puts 'cars'
p cars

puts '

...sample
selected_cars = cars.select do |car|
  valid_colors.include?(car[:color])
end

'
selected_cars = cars.select do |car|
  valid_colors.include?(car[:color])
end

puts 'selected_cars'
p selected_cars

puts 'cars'
p cars

puts '

...sample: 
selected_car_types = cars.select { |car|
  valid_colors.include?(car[:color])
}.map {|car| car[:type]}

'
selected_car_types = cars.select { |car|
  valid_colors.include?(car[:color])
}.map {|car| car[:type]}


puts 'selected_car_type'
p selected_car_types

inspect_callback_as_method = cars.select{|car| valid_colors.include? car[:color]}.map{|car| car.inspect}

puts '
inspect_callback_as_metod'
p inspect_callback_as_method

a_class_method_callback_as_proc_call = cars.select{|car| valid_colors.include? car[:color]}.map &:dup
puts 'a class method callback as a proc call'
p a_class_method_callback_as_proc_call

puts '
#reject'
reverse_selected_cars = cars.reject{|car| car[:color] == 'red'}
p reverse_selected_cars

puts 'original cars array'
p cars

puts '
#reduce'
p array
puts 'array.reduce{|sum, x| sum + x} 
=>' + array.reduce{|sum, x| sum + x}.to_s


p array_of_words
puts 'array_of_words.reduce{|sum, x| sum + x} 
=>' + array_of_words.reduce{|sum, x| sum + x}.to_s

puts '#join - will process anything (iterable or enumerable)'
puts 'array_of_words.join(', ') 
=>' + array_of_words.join(', ')

puts 'cars.join(', ') 
=>' + cars.join(', ')

puts 'array_of_events.join(', ') 
=>' + array_of_events.join(', ')

begin
puts 'array_of_events[0].join(', ') 
=>' + array_of_events[0].join(', ')
rescue NoMethodError => e
  puts e.class.to_s + ': ' +e.message
end


puts '
kitchen sink - all methods'

days = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
p days

puts'

tasks = days.map{|day| day.odd? ?
  {task: \'dishes\', minutes: Random.rand(20)} :
  {task: \'sweep\',minutes: Random.rand(20)}}
  .select{|task| task[:minutes] < 15}
  .reject{|task| task[:minutes] < 5}
  .reduce(0) {|sum, task| sum + task[:minutes]}
'

tasks = days.map{|day| day.odd? ?
  {task: 'dishes', minutes: Random.rand(20)} :
  {task: 'sweep',minutes: Random.rand(20)}}
  .select{|task| task[:minutes] < 15}
  .reject{|task| task[:minutes] < 5}
  .reduce(0) {|sum, task| sum + task[:minutes]}

puts tasks


puts '- - - more samples'

customers = {
  alessi: 8,
  hanh: 2,
  donnely: 2,
  shaw: 5,
  stein: 2,
  ngabe: 4
}

puts 'customers'
p customers

customer_sitting = customers.map do |last_name, number_in_party|
     [
       last_name,
       number_in_party >=4 ? :big_table : :small_table
     ]
end

p customer_sitting

p array_of_words
p array_of_words.grep(/h/)
p array_of_words.grep_v(/h/)

puts (1..10).to_a.all? { |i| i > 5 }
puts (1..10).to_a.any? { |i| i > 5 }

puts (1..10).to_a.push(nil).all?
puts (1..10).to_a.map{ nil }.push(1).any?

puts (1..10).to_a.count
puts (1..10).to_a.sum

p (1..10).to_a.push(1).detect { |i| i == 1 }
p (1..10).to_a.push(1).find { |i| i == 1 } # identical to #detect
p (1..10).to_a.push(1).find_all { |i| i == 1 } # identical to select
p (1..10).to_a.drop(5) # does not modify original r
p (1..10).to_a.take(5) # oppostire of drop, does not modify original r

p (1..10).to_a.sort { |a, b| b <=> a } # reverse sorting order
p array_of_words.sort { |a, b| b <=> a } # reverse sorting order
p array_of_words.sort { |a, b| a <=> b } # normal order
p array_of_words.sort_by { |word| word.length } # change criteria
