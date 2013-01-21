require 'nokogiri'
require 'open-uri'

craigslist_apartments_url = "http://toronto.en.craigslist.ca/apa/"

craigslist_apartments = Nokogiri::HTML(open(craigslist_apartments_url))

# Create an array called page_contents
page_contents = []

craigslist_apartments.css('p.row').each do |item|
  # Use << (sometimes called a shovel) to add each of the links to the
  # page_contents array. When you run this script, nothing will be printed
  # to the terminal but page_contents will contain all of the items
  page_contents << item.css('a')
end
