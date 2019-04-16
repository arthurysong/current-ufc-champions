require_relative "./champion"
require_relative "./division"
require "nokogiri"
require "open-uri"
require "pry"

class CurrentUfcChampions::CLI
  
  #scraping
  html = open("http://www.espn.com/mma/story/_/id/14947566/current-all-ufc-champions")
  doc = Nokogiri::HTML(html)
  division_array = doc.css("h2 a") #array of division elements
  champion_array = doc.css("p strong a")
  array_of_champion_names = champion_array.collect do |champion| #collect all NAMES into array_of_champion_names so I can insert blank name in next line
    champion.text
  end
  array_of_champion_names.insert(6, "") #hard code position 6 because title is vacant
  array_of_info = doc.css("p").text.split("Won title:") #select p element texts and split by "won title"
  array_of_info = array_of_info[1, 12] #delete text elements that are extraneous
  binding.pry
  
  
  DIVISION_INSTANCES = division_array.collect do |division_element| #creates an array of division instances
    temp = division_element.text.split(" (") #temp array containing name and weight .. need to parse
    temp[1] = temp[1].chomp(")") #temp[0] equal to name temp[1] equal to weight
    CurrentUfcChampions::Division.new(temp[0], temp[1])
  end
  
  DIVISION_INSTANCES.each_with_index do |division, index| #sets each division's champion to new champion with champion name
   # puts champion_array[index].text
    if array_of_champion_names[index] != "" 
      division.champion = CurrentUfcChampions::Champion.new(array_of_champion_names[index])
    else
      division.champion = CurrentUfcChampions::Champion.new("No Champion")
    end
  end
  
  DIVISION_INSTANCES.each_with_index do |division, index|
    
  end
  
#  HEAVYWEIGHT = CurrentUfcChampions::Division.new("Heavyweight", "Up to 265 pounds")
#  HEAVYWEIGHT.champion = CurrentUfcChampions::Champion.new("Daniel Cormier")
#  LIGHT_HEAVYWEIGHT = CurrentUfcChampions::Division.new("Light heavyweight", "205")
#  LIGHT_HEAVYWEIGHT.champion = CurrentUfcChampions::Champion.new("Jon Jones")
#  MIDDLEWEIGHT = CurrentUfcChampions::Division.new("Middleweight", "185")
#  MIDDLEWEIGHT.champion = CurrentUfcChampions::Champion.new("Robert Whittaker")
#  WELTERWEIGHT = CurrentUfcChampions::Division.new("Welterweight", "170")
#  WELTERWEIGHT.champion = CurrentUfcChampions::Champion.new("Kamaru Usman")
#  LIGHTWEIGHT = CurrentUfcChampions::Division.new("Lightweight", "155")
#  LIGHTWEIGHT.champion = CurrentUfcChampions::Champion.new("Khabib Nurmagomedov")
#  MENS_FEATHERWEIGHT = CurrentUfcChampions::Division.new("Men's featherweight", "145")
#  MENS_FEATHERWEIGHT.champion = CurrentUfcChampions::Champion.new("Max Holloway")
#  MENS_BANTAMWEIGHT = CurrentUfcChampions::Division.new("Men's bantamweight", "135")
#  MENS_BANTAMWEIGHT.champion = CurrentUfcChampions::Champion.new("Title is vacant")
#  MENS_FLYWEIGHT = CurrentUfcChampions::Division.new("Men's flyweight", "125")
#  MENS_FLYWEIGHT.champion = CurrentUfcChampions::Champion.new("Henry Cejudo")
#  WOMENS_FEATHERWEIGHT = CurrentUfcChampions::Division.new("Women's featherweight", "145")
#  WOMENS_FEATHERWEIGHT.champion = CurrentUfcChampions::Champion.new("Amanda Nunes")
#  WOMENS_BANTAMWEIGHT = CurrentUfcChampions::Division.new("Women's bantamweight", "135")
#  WOMENS_BANTAMWEIGHT.champion = CurrentUfcChampions::Champion.new("Amanda Nunes")
#  WOMENS_FLYWEIGHT = CurrentUfcChampions::Division.new("Women's flyweight", "125")
#  WOMENS_FLYWEIGHT.champion = CurrentUfcChampions::Champion.new("Valentina Shevchenko")
#  STRAWWEIGHT = CurrentUfcChampions::Division.new("Strawweight", "115")
#  STRAWWEIGHT.champion = CurrentUfcChampions::Champion.new("Rose Namajunas")
  
  def call
    puts "Welcome to Current UFC Champions"
    list_of_divisions
    user_input
  end
  
  def list_of_divisions
    puts "List of Divisions:"
    DIVISION_INSTANCES.each_with_index do |division, index|
      puts "#{index + 1}. #{division.name} (#{division.weight})"
    end
    
  #  puts "1. #{HEAVYWEIGHT.name} (#{HEAVYWEIGHT.weight})"
  #  puts "2. #{LIGHT_HEAVYWEIGHT.name} (#{LIGHT_HEAVYWEIGHT.weight})"
  #  puts "3. #{MIDDLEWEIGHT.name} (#{MIDDLEWEIGHT.weight})"
  #  puts "4. #{WELTERWEIGHT.name} (#{WELTERWEIGHT.weight})"
  #  puts "5. #{LIGHTWEIGHT.name} (#{LIGHTWEIGHT.weight})"
  #  puts "6. #{MENS_FEATHERWEIGHT.name} (#{MENS_FEATHERWEIGHT.weight})"
  #  puts "7. #{MENS_BANTAMWEIGHT.name} (#{MENS_BANTAMWEIGHT.weight})"
  #  puts "8. #{MENS_FLYWEIGHT.name} (#{MENS_FLYWEIGHT.weight})"
  #  puts "9. #{WOMENS_FEATHERWEIGHT.name} (#{WOMENS_FEATHERWEIGHT.weight})"
  #  puts "10. #{WOMENS_BANTAMWEIGHT.name} (#{WOMENS_BANTAMWEIGHT.weight})"
  #  puts "11. #{WOMENS_FLYWEIGHT.name} (#{WOMENS_FLYWEIGHT.weight})"
  #  puts "12. #{STRAWWEIGHT.name} (#{STRAWWEIGHT.weight})"
  end
  
  def user_input
 #   choice = "" 
 #   while choice != "q"
    puts "Select which division you would like to see (1-12) or 'q' to quit: "
    choice = gets.chomp
    case choice
    when "1"
      puts "Heavyweight Division (Up to 265 pounds)"
      puts "Champion: #{DIVISION_INSTANCES[0].champion.name}"
      puts "Won title: July 7, 2018"
      puts "Defenses: 1"
      return_to_main_menu
    when "2"
      puts "Light heavyweight Division (205)"
      puts "Champion: #{DIVISION_INSTANCES[1].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "3"
      puts "Middleweight Division (185)"
      puts "Champion: #{DIVISION_INSTANCES[2].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "4"
      puts "Welterweight Division (170)"
      puts "Champion: #{DIVISION_INSTANCES[3].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "5"
      puts "Lightweight Division (155)"
      puts "Champion: #{DIVISION_INSTANCES[4].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "6"
      puts "Men's featherweight Division (145)"
      puts "Champion: #{DIVISION_INSTANCES[5].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "7"
      puts "Men's bantamweight Division (135)"
      puts "Champion: #{DIVISION_INSTANCES[6].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "8"
      puts "Men's flyweight Division (125)"
      puts "Champion: #{DIVISION_INSTANCES[7].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "9"
      puts "Women's featherweight Division (145)"
      puts "Champion: #{DIVISION_INSTANCES[8].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "10"
      puts "Women's bantamweight Division (135)"
      puts "Champion: #{DIVISION_INSTANCES[9].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "11"
      puts "Women's flyweight Division (125)"
      puts "Champion: #{DIVISION_INSTANCES[10].champion.name}"
      puts "Won title: "
      puts "Defenses: "
      return_to_main_menu
    when "12"
      puts "Strawweight Division (115)"
      puts "Champion: #{DIVISION_INSTANCES[11].champion.name}"
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