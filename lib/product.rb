class Product

  attr_accessor :name

  def initialize name
    @name = name
  end

  def name_even?
    name.gsub(/[^a-zA-Z]/, '').length % 2 == 0
  end

end
