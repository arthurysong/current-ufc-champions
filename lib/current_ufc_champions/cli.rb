

class CurrentUfcChampions::CLI
  
  def call
    puts "Welcome to Current UFC Champions"
    list_of_divisions
    user_input
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
  
  def user_input
 #   choice = "" 
 #   while choice != "q"
    puts "Select which division you would like to see (1-12) or 'q' to quit: "
    choice = gets.chomp
    case choice
    when "1"
      puts "Heavyweight Division (Up to 265 pounds)"
      puts "Champion: Daniel Cormier"
      puts "Won title: July 7, 2018"
      puts "Defenses: 1"
      return_to_main_menu
    when "2"
      puts "Light heavyweight Division (205)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "3"
      puts "Middleweight Division (185)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "4"
      puts "Welterweight Division (170)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "5"
      puts "Lightweight Division (155)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "6"
      puts "Men's featherweight Division (145)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "7"
      puts "Men's bantamweight Division (135)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "8"
      puts "Men's flyweight Division (125)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "9"
      puts "Women's featherweight Division (145)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "10"
      puts "Women's bantamweight Division (135)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "11"
      puts "Women's flyweight Division (125)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "12"
      puts "Strawweight Division (115)"
      puts "Champion: "
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "q"
      return true
    else
      puts "Invalid input: "
      user_input
    end
  #  end
  end
  
  def return_to_main_menu
    puts "Return to Main Menu? (y/n):"
    choice = gets.strip.downcase
    if choice == "y"
      list_of_divisions
      user_input
    end
  end
  
end