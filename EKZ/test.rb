module Eating
  def eat
    puts "nyam...nyam!!!"
  end
end

module Flying
  def fly
    puts "fly...fly!!!"
  end
end

module Meow
  def say_meow
    puts "Meow...meow!!!"
  end
end

class Bird
  include Eating
  include Flying
end

class Cat
  include Eating
  include Meow
end

bird = Bird.new
puts "Птах:"
bird.eat
bird.fly

puts

puts "Кіт:"
cat = Cat.new
cat.eat
cat.say_meow
