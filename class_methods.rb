class FireBuilder

    def self.how_many_fires
        @num_fires
    end

    def light_a_fire
        "it's burning now"
    end
end

class DampFireBuilder < FireBuilder
    def light_a_fire
        "I've used a fire starter kit and " + super
    end
end

fireBuilder = DampFireBuilder.new
puts fireBuilder.light_a_fire

# reopen
class FireBuilder
    def light_a_fire
        "and it didn't light"
    end
end

puts fireBuilder.light_a_fire


# same as def self.ho_many_fires within FireBuilder definition
def FireBuilder.how_many
    @num_fires
end

puts FireBuilder.how_many_fires
puts fireBuilder.respond_to? :how_many_fires

class << FireBuilder
    def whoAmI
        self
    end
end


puts FireBuilder.whoAmI
        
