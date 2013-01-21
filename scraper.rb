require 'nokogiri'
require 'open-uri'

craigslist_apartments_url = "http://toronto.en.craigslist.ca/apa/"

craigslist_apartments = Nokogiri::HTML(open(craigslist_apartments_url))

page_contents = []

craigslist_apartments.css('p.row').each do |item|
  apartment = Hash.new

  # Create a key called 'description' and set the value
  # we call '.text', a nokogiri method, because it strips
  # out the surrounding tags (e.g., <a href="..."> and </a>)
  apartment["description"] = item.css('a').text

  # Each item in the array will contain a hash
  # for now the hash only contains a description
  page_contents << apartment

end

# Now let's print out the contents of the page_contents array
# to the terminal. You should expect to see a list of hashes
# containing the key ("description") and the corresponding values
puts page_contents
