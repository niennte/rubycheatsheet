module MathFuncs
    def addTwoNumbers(num1, num2)
        num1 + num2
    end
end

class FireBuilder
    include MathFuncs
end


fire_builder = FireBuilder.new
puts fire_builder.addTwoNumbers(1,3)
