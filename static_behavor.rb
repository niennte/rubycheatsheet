class FireBuilderClassObject
  def self.number_of_fires
    unless defined? @number_of_fires
      @number_of_fires = 0
    end
    @number_of_fires
  end

  def self.number_of_fires=(n)
    @number_of_fires = n
  end

  def light_a_fire
    self.class.number_of_fires = self.class.number_of_fires + 1
    "Ok it's burning. There are now #{self.class.number_of_fires} out there."
  end
end


builder_one = FireBuilderClassObject.new
builder_two = FireBuilderClassObject.new

puts builder_one.light_a_fire
puts builder_two.light_a_fire

puts FireBuilderClassObject.number_of_fires
