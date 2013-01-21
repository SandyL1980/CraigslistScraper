require 'nokogiri'
require 'open-uri'

craigslist_apartments_url = "http://toronto.en.craigslist.ca/apa/"

craigslist_apartments = Nokogiri::HTML(open(craigslist_apartments_url))

page_contents = []

craigslist_apartments.css('p.row').each do |item|
  apartment = Hash.new

  # Now we want to add a price, number of bedrooms, and square footage for
  # each of the apartments to the hash. Our only problem is that all of this information
  # is stored in a single element, called .itemph. If we try to add .itemph it will give us
  # everything in one block of text. Try running this script and see what happens.
  apartment["description"] = item.css('a').text
  apartment["price"] = item.css('.itemph').text

  page_contents << apartment

end

puts page_contents