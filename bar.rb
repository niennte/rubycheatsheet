class Bar
    def foo
        puts 'This comes before the return keyword'
        return 'yo'
        puts 'This is the last line'
    end
end

bar = Bar.new
puts bar.foo



puts Class.methods
