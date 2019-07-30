class BestLaptop::Laptop

  attr_accessor :name, :price, :description, :url, :pros, :cons, :bottom_line
  
  @@all = []
  
  def initialize(laptop_hash)
    laptop_hash.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end
  
  def self.create(laptops_array)
    laptops_array.each do |laptop|
      self.new(laptop)
    end
  end
  
  def add_laptop_info(attr_hash)
    attr_hash.each do |key, value| 
      self.send(("#{key}="), value)
    end
  end
  
  def self.all
    @@all
  end
  
end