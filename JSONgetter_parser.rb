require "json" 
require "open-uri"

class APIAccessor

  url = "http://lcboapi.com/products.json"

  def retrieve_data(url)
    response = open(url).read
    data = JSON.parse(response)
    return data["result"]
  end
     
  def display_product(product)
    puts "<p>#{product["name"]}</p>"
    puts ""
  end

puts retrieve_data(url)

end

