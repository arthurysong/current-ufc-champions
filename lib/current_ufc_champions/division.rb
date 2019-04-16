class CurrentUfcChampions::Division
  attr_accessor :name, :weight
  @@all = []
  
  def initialize(name, weight)
    @name = name
    @weight = weight
  end
  
  def self.all
    @@all
  end
  
end