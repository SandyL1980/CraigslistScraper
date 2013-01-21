require 'nokogiri'
require 'open-uri'

craigslist_apartments_url = "http://toronto.en.craigslist.ca/apa/"

craigslist_apartments = Nokogiri::HTML(open(craigslist_apartments_url))

page_contents = []

def parse_description(description)
  # Here's a sample of a line we need to parse
  # $1750 / 1br - 650ft² -
  # We can use a regular expression to find the price given the line above
  # One thing to note: when we run the match method on the description it will return
  # a MatchData object, like so:
  #  <MatchData "$1750" 1:"1750">
  # We'll need to access the "1750" the same way we access arrays
  # If you're totally confused it's worth referencing a guide on regular expressions
  # http://net.tutsplus.com/tutorials/ruby/ruby-for-newbies-regular-expressions/

  # The following block of code checks to see if the string 'description'
  # contains a price
  if description.match(/\$(\d+)/)
    # if the description contains a price, assign it to the variable price
    price = description.match(/\$(\d+)/)
    # because we're using the match method we're dealing with a MatchData object
    # we can pull the price out of it by calling price[1]
    return price[1]
  else
    # if the regular expression can't find a price it will return 'nil'
    # this can cause the script to break, so we're setting a price of $0
    # for apartment listings that don't contain one
    return 0
  end
end

craigslist_apartments.css('p.row').each do |item|
  apartment = Hash.new

  apartment["description"] = item.css('a').text

  # Now we can use our parse_description method to take the contents
  # of the .itemph element and parse them
  apartment["price"] = parse_description(item.css('.itemph').text)

  page_contents << apartment

end

# When we print out the contents of our array we should see a
# description and price listed for each item in the array
puts page_contents
