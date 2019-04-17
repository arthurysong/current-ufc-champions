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
  array_of_info.insert(6, "") #hard code position 6 because title is vacant

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
  
  #setting attributes of champion (title_won, outcome, defenses)
  DIVISION_INSTANCES.each_with_index do |division, index|
    if array_of_info[index] != ""
      division.champion.title_won = array_of_info[index].split("\n")[0].strip
      division.champion.outcome = array_of_info[index].split("\n")[1].delete_prefix("• Outcome: ")
      division.champion.defenses = array_of_info[index].split("\n")[2].delete_prefix("• Defenses: ")[/\d/]
    end
  end
  
  #hard code index 6 because champion is vacant.
  DIVISION_INSTANCES[6].champion.title_won = "N/A"
  DIVISION_INSTANCES[6].champion.outcome = "N/A"
  DIVISION_INSTANCES[6].champion.defenses = "N/A"
  
  def call
    puts "\n\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts "Welcome to Current UFC Champions"
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    list_of_divisions
    user_input
  end
  
  def list_of_divisions
    puts "\nList of Divisions:"
    DIVISION_INSTANCES.each_with_index do |division, index|
      puts "#{index + 1}. #{division.name} (#{division.weight})"
    end
  end
  
  def user_input
    puts "Select which division you would like to see (1-12) or 'q' to quit: "
    choice = gets.chomp.downcase
    valid_choices = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "q"]
    until valid_choices.include?(choice) do #validate choice by comparing against array of valid choices
      puts "Invalid input.."
      puts "Select which division you would like to see (1-12) or 'q' to quit: "
      choice = gets.chomp.downcase
    end
    
    if choice != "q"
      DIVISION_INSTANCES[choice.to_i - 1].display_info
      return_to_main_menu
    end
  end
  
  def return_to_main_menu
    puts "Return to Main Menu? (y/n):"
    choice = gets.strip.downcase
    until (choice == "y") || (choice == "n") do
      puts "Invalid input"
      puts "Return to Main Menu? (y/n):"
      choice = gets.strip.downcase
    end
    if choice == "y"
      list_of_divisions
      user_input
    end
  end
  
end