require 'nokogiri'
require 'open-uri'

# Assign the url we want to scrape to a variable
craigslist_apartments_url = "http://toronto.en.craigslist.ca/apa/"

# Use the 'open' method in Nokogiri to scrape the contents
# of the target url
craigslist_apartments = Nokogiri::HTML(open(craigslist_apartments_url))

# Print out each paragraph element
craigslist_apartments.css('p.row').each do |item|
  puts item
end
