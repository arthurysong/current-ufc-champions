

class CurrentUfcChampions::CLI
  
  def call
    puts "Welcome to Current UFC Champions"
    list_of_divisions
  end
  
  def list_of_divisions
    puts "List of Divisions:"
    puts "1. Heavyweight (Up to 265 pounds)"
    puts "2. Light heavyweight (205)"
    puts "3. Middleweight (185)"
    puts "4. Welterweight (170)"
    puts "5. Lightweight (155)"
    puts "6. Men's featherweight (145)"
    puts "7. Men's bantamweight (135)"
    puts "8. Men's flyweight (125)"
    puts "9. Women's featherweight (145)"
    puts "10. Women's bantamweight (135)"
    puts "11. Women's flyweight (125)"
    puts "12. Strawweight (115)"
  end
  
end