require "pry"
require "nokogiri"
require "open-uri"

require_relative "./current_ufc_champions/version"
require_relative "./current_ufc_champions/champion"
require_relative "./current_ufc_champions/division"
require_relative "./current_ufc_champions/scraper"
require_relative "./current_ufc_champions/cli"



module CurrentUfcChampions
  class Error < StandardError; end
  # Your code goes here...
end
