class Furniture
  def initialize(name, weight)
    @name = name
    @weight = weight
  end

  def get_description
    raise NotImplementedError
  end
end

class Chair < Furniture
  def initialize(price)
    super("simple_chair", "5 kilo")
    @price = price
  end

  def get_description
    "Ви замовили стілець: #{@name}, вагою: #{@weight} за ціною #{@price} грн."
  end
end

class Sofa < Furniture
  def initialize(price)
    super("ultra_sofa", "30 kilo")
    @price = price
  end

  def get_description
    "Ви замовили диван: #{@name}, вагою: #{@weight} за ціною #{@price} грн."
  end
end

class FurnitureFactory
  def create_furniture
    raise NotImplementedError
  end
end

class ChairFactory < FurnitureFactory
  def initialize(price)
    @price = price
  end
  def create_furniture
    Chair.new(@price)
  end

end

class SofaFactory < FurnitureFactory
  def initialize(price)
    @price = price
  end
  def create_furniture
    Sofa.new(@price)
  end
end

def choice_furniture
  input = gets.chomp.downcase
  case input
  when "h"
    ChairFactory.new(100)
  when "s"
    SofaFactory.new(400)
  else
    puts("Хибні значення! Потрібно водити \"h\" або \"s\"")
    choice_furniture
  end
end

puts("Зробіть ваш вибір:")
puts("h - замовити стілець")
puts("s - замовити диван")

factory = choice_furniture
furniture = factory.create_furniture
puts furniture.get_description