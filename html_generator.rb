require "json"
require "open-uri"

class HtmlGenerator
  
  def show
    print_header
    puts "Action:  Show"
    print_footer
  end
  
  def index
    print_header
    
    products = retrieve_data
    
    products.each do |product|
      display_product(product)
    
    end
    
    print_footer
  
  end
  
  private
  
  def display_product(product)
    puts "<div>"
    puts "<p><b>#{product["name"]}</b></p>"
    puts "<img src=#{product["image_url"]} alt=#{product["name"]} style='float:left' width='200' height='400'>"
    puts "<p>#{product["id"]}</p>"
    puts "<p>#{product["producer_  name"]}</p>"
    puts "<p>#{product["primary_category"]}</p>"
    puts "<p>$#{(product["price_in_cents"].to_f)/100}</p>"
    puts "</div>"
  end
  
  def print_header
    puts "<!DOCTYPE html>"
    puts "<html>"
    puts "<body>"
  end
  
  def print_footer
    puts "</body>"
    puts "</html>"
  end
  
  def retrieve_data
    response = open("http://lcboapi.com/products.json").read
    data = JSON.parse(response)
    return data["result"]
  end
  
end