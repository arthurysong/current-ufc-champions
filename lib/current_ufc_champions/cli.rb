class CurrentUfcChampions::CLI
  def call
    puts "\n\n=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    puts "Welcome to Current UFC Champions"
    puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
    CurrentUfcChampions::Scraper.new.scrape
    list_of_divisions
    user_input
  end
  
  def list_of_divisions
    puts "\nList of Divisions:"
    CurrentUfcChampions::Division.all.each_with_index do |division, index|
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
      CurrentUfcChampions::Division.all[choice.to_i - 1].display_info
      return_to_main_menu
    end
  end
  
  def return_to_main_menu
    puts "\nReturn to Main Menu? (y/n):"
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