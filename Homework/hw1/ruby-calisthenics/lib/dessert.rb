class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  def healthy?
    return true if @calories < 200
    false
  end
  def delicious?
    true
  end
end

class JellyBean < Dessert
  attr_accessor :flavor
  def initialize(flavor)
    @flavor = flavor
    @name = flavor + ' jelly bean'
    @calories = 5
  end
  def delicious?
    return false if @flavor == 'licorice'
    true
  end
end

#begin dessert tests
puts Dessert.new('cake', 100) != nil
dessert = Dessert.new('cake', 100); 
  puts dessert.name == 'cake'; puts dessert.calories == 100
dessert = Dessert.new('cake', 100);
  dessert.name = 'oreo'; dessert.calories = -1
  puts dessert.name == 'oreo'; puts dessert.calories == -1
dessert = Dessert.new('scissor', -2000)
  puts dessert.healthy? == true
dessert = Dessert.new('cup', 4000)
  puts dessert.healthy? == false
dessert = Dessert.new('pencil', 5)
  puts dessert.delicious? == true
#begin jelly bean tests
puts JellyBean.new('phone') != nil
jellyBean = JellyBean.new('gelatiniousSugar');
  puts jellyBean.name == 'gelatiniousSugar jelly bean'
jellyBean = JellyBean.new('glue stick');
  puts jellyBean.calories == 5
jellyBean = JellyBean.new('saasbook')
  puts jellyBean.flavor == 'saasbook'
jellyBean = JellyBean.new('saasbook')
  jellyBean.flavor = 'ruby'; puts jellyBean.flavor == 'ruby'
jellyBean = JellyBean.new('licorice')
  puts jellyBean.delicious? == false
jellyBean = JellyBean.new('liquorish')
  puts jellyBean.delicious? == true
