class CurrentUfcChampions::Champion
  attr_accessor :name, :title_won, :outcome, :defenses
  @@all = []
  
  def self.all
    @@all
  end
  
  def initialize (name)
    @name = name
    @@all << self
  end
  
  def display_info
    puts "Champion: #{@name}"
    puts "Won title: #{@title_won}"
    puts "Outcome: #{@outcome}"
    puts "Defenses: #{@defenses}"
  end
end