class CurrentUfcChampions::Scraper
  DOC = Nokogiri::HTML(open("http://www.espn.com/mma/story/_/id/14947566/current-all-ufc-champions"))
  
  def scrape
    scrape_divisions
    scrape_champions
    scrape_champions_info
  end
  
  def scrape_divisions
    division_array = DOC.css("h2 a")
    division_array.each do |division_element|
      temp = division_element.text.split(" (") #temp array containing name and weight .. need to parse
      temp[1] = temp[1].chomp(")") #temp[0] equal to name temp[1] equal to weight
      CurrentUfcChampions::Division.new(temp[0], temp[1])
    end  
  end
  
  def scrape_champions
    champion_array = DOC.css("p strong a")
    array_of_champion_names = champion_array.collect do |champion| #collect all NAMES into array_of_champion_names so I can insert blank name in next line
      champion.text
    end
    
    array_of_champion_names.insert(6, "") 
    
    CurrentUfcChampions::Division.all.each_with_index do |division, index| 
    if array_of_champion_names[index] != "" 
      division.champion = CurrentUfcChampions::Champion.new(array_of_champion_names[index])
    else
      division.champion = CurrentUfcChampions::Champion.new("No Champion")
    end
  end
  end
  
  def scrape_champions_info
    array_of_info = DOC.css("p").text.split("Won title:")
    array_of_info = array_of_info[1, 12]
    
    array_of_info.insert(6, "")
    
    CurrentUfcChampions::Division.all.each_with_index do |division, index|
      if array_of_info[index] != ""
        division.champion.title_won = array_of_info[index].split("\n")[0].strip
        division.champion.outcome = array_of_info[index].split("\n")[1].delete_prefix("• Outcome: ")
        division.champion.defenses = array_of_info[index].split("\n")[2].delete_prefix("• Defenses: ")[/\d/]
      end
    end
    
    CurrentUfcChampions::Division.all[6].champion.title_won = "N/A"
    CurrentUfcChampions::Division.all[6].champion.outcome = "N/A"
    CurrentUfcChampions::Division.all[6].champion.defenses = "N/A"
  end
end