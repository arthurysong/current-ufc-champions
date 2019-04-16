class CurrentUfcChampions::Division
  attr_accessor :name, :weight
  @@all = []
  
  def self.all
    @@all
  end
  
end