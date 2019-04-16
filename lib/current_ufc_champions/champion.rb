class CurrentUfcChampions::Champion
  attr_accessor :name, :title_won, :outcome, :defenses
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize (name)
    @name = name
  end
  
end