case "Hello"
  when /Hell/
    puts "We matched."
else
  puts "We didn't match."
end


case /Hell/
  when "Hello"
    puts "We matched."
else
  puts "We didn't match."
end

