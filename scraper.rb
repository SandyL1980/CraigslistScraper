require 'nokogiri'
require 'open-uri'

# Assign the url we want to scrape to a variable
craigslist_apartments_url = "http://toronto.en.craigslist.ca/apa/"

# Use the 'open' method in Nokogiri to scrape the contents
# of the target url
craigslist_apartments = Nokogiri::HTML(open(craigslist_apartments_url))

# Print the contents of craigslist_apartments to the terminal
puts craigslist_apartments
