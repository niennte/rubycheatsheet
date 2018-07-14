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


foo = ""
foo.extend MathFuncs
puts foo.addTwoNumbers(1,3)


foo1 = ""
class << foo1
    include MathFuncs
end
puts foo1.addTwoNumbers(1,3)


class Bar
    extend MathFuncs
end

bar = Bar.new
puts Bar.addTwoNumbers(1,3)
puts bar.respond_to? :addTwoNumber
