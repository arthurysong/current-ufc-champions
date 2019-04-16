require_relative "./champion"
require_relative "./division"

class CurrentUfcChampions::CLI
  HEAVYWEIGHT = CurrentUfcChampions::Division.new("Heavyweight", "Up to 265 pounds")
  LIGHT_HEAVYWEIGHT = CurrentUfcChampions::Division.new("Light heavyweight", "205")
  MIDDLEWEIGHT = CurrentUfcChampions::Division.new("Middleweight", "185")
  WELTERWEIGHT = CurrentUfcChampions::Division.new("Welterweight", "170")
  LIGHTWEIGHT = CurrentUfcChampions::Division.new("Lightweight", "155")
  MENS_FEATHERWEIGHT = CurrentUfcChampions::Division.new("Men's featherweight", "145")
  MENS_BANTAMWEIGHT = CurrentUfcChampions::Division.new("Men's bantamweight", "135")
  MENS_FLYWEIGHT = CurrentUfcChampions::Division.new("Men's flyweight", "125")
  WOMENS_FEATHERWEIGHT = CurrentUfcChampions::Division.new("Women's featherweight", "145")
  WOMENS_BANTAMWEIGHT = CurrentUfcChampions::Division.new("Women's bantamweight", "135")
  WOMENS_FLYWEIGHT = CurrentUfcChampions::Division.new("Women's flyweight", "125")
  STRAWWEIGHT = CurrentUfcChampions::Division.new("Strawweight", "115")
  
  def call
    puts "Welcome to Current UFC Champions"
    list_of_divisions
    user_input
  end
  
  def list_of_divisions
    puts "List of Divisions:"
    puts "1. #{HEAVYWEIGHT.name} (#{HEAVYWEIGHT.weight})"
    puts "2. #{LIGHT_HEAVYWEIGHT.name} (#{LIGHT_HEAVYWEIGHT.weight})"
    puts "3. #{MIDDLEWEIGHT.name} (#{MIDDLEWEIGHT.weight})"
    puts "4. #{WELTERWEIGHT.name} (#{WELTERWEIGHT.weight})"
    puts "5. #{LIGHTWEIGHT.name} (#{LIGHTWEIGHT.weight})"
    puts "6. #{MENS_FEATHERWEIGHT.name} (#{MENS_FEATHERWEIGHT.weight})"
    puts "7. #{MENS_BANTAMWEIGHT.name} (#{MENS_BANTAMWEIGHT.weight})"
    puts "8. #{MENS_FLYWEIGHT.name} (#{MENS_FLYWEIGHT.weight})"
    puts "9. #{WOMENS_FEATHERWEIGHT.name} (#{WOMENS_FEATHERWEIGHT.weight})"
    puts "10. #{WOMENS_BANTAMWEIGHT.name} (#{WOMENS_BANTAMWEIGHT.weight})"
    puts "11. #{WOMENS_FLYWEIGHT.name} (#{WOMENS_FLYWEIGHT.weight})"
    puts "12. #{STRAWWEIGHT.name} (#{STRAWWEIGHT.weight})"
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