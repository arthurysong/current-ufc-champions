class CurrentUfcChampions::Division
  attr_accessor :name, :weight, :champion
  @@all = []
  
  def initialize(name, weight)
    @name = name
    @weight = weight
  end
  
  def self.all
    @@all
  end
  
  def display_info
    puts "#{@name} Division (#{@weight})"
    @champion.display_info
  end
  
end