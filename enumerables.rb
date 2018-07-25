puts 'using #each'
dollar_amounts = [2247, 5834, 89, 89533]
dollar_amounts.each {|amount| puts amount}

EXCHANGE_RATE = 0.865448692

euro_amounts = []

returned_array = dollar_amounts.each_with_index do |amount, index|
  euro_amounts[index] = (amount * EXCHANGE_RATE).round(2)
end

euro_amounts.each {|amount| puts amount }
dollar_amounts.each {|amount| puts amount }
puts "is dollar amounts returned by #each?  " + (returned_array == dollar_amounts).to_s
puts "is euro amounts returned by #each? " + (returned_array == euro_amounts).to_s

puts 'using map'
puts 'dollar_amounts'
dollar_amounts = [2247, 5834, 89, 89533]
dollar_amounts.each {|amount| puts amount}



returned_array = dollar_amounts.map do |amount|
  (amount * EXCHANGE_RATE).round(2)
end

puts 'euro_amounts'
euro_amounts.each {|amount| puts amount }
puts 'dollar_amounts'
dollar_amounts.each {|amount| puts amount }
puts "is dollar amounts returned by #map?  " + (returned_array == dollar_amounts).to_s
puts "is euro amounts returned by #map? " + (returned_array == euro_amounts).to_s

puts '

sample:

array = [1, 2, 3]
effects = array.each{|x| # create record from x }
added = array.map{ |x| x + 2 }

If we read from added, we’ll get [3, 4, 5]. If we read from effects, we’ll still get [1, 2, 3]. Here’s the difference between these two: .map will return a new modified array, whereas .each will return the original array.'
