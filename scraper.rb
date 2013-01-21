require 'nokogiri'
require 'open-uri'

craigslist_apartments_url = "http://toronto.en.craigslist.ca/apa/"

craigslist_apartments = Nokogiri::HTML(open(craigslist_apartments_url))

page_contents = []

craigslist_apartments.css('p.row').each do |item|
  # We're going to store data using an array of hashes
  # We'll need a hash that we can use to store the following data
  # - description
  # - price
  # - number of bedrooms
  # - square footage
  # Start by creating a hash called 'apartment'
  # We'll soon be able to access individual items in the page_contents array
  # by using commands like page_contents[0]["description"]
  apartment = Hash.new

  page_contents << item.css('a')

end
