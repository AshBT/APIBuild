require "json"
require "open-uri"

class HtmlGenerator
  
  def show(id)  #show action 
    print_header
    
    #retrieve a single product's infor 
    product = retrieve_data_by_id(id)
    
    #display the product info
    display_detailed_product(product)
    
    
                  
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
  
  def display_detailed_product(product)
    puts "<div class='product'><h2>#{product["name"]}</h2>"
    puts "<img src=#{product["image_url"]} alt='#{product["name"]}' width='200' height='400'>"
    puts "<p>#{product["id"]}</p>"
    puts "<p>#{product["producer_name"]}</p>"
    puts "<p>#{product["primary_category"]}</p>"
    puts "<p>$#{(product["price_in_cents"].to_f)/100}</p>"
    puts "</div>"    
  end
  
  def display_product(product)
    puts "<div class='product'><h2>#{product["name"]}</h2>"
    puts "<img src=#{product["image_url"]} alt='#{product["name"]}' width='100' height='175'>"
    puts "<p class='product_id'>#{product["id"]}</p>"
    puts "<p>#{product["producer_name"]}</p>"
    puts "<p>#{product["primary_category"]}</p>"
    puts "<p class='price_in_cents'>$#{(product["price_in_cents"].to_f)/100}</p>"
    puts "</div>"
  end
  
  def print_header
    puts "<!DOCTYPE html>"
    puts "<html>"
    puts "<head>"
    puts '<link href=styles.css rel="stylesheet" type="text/css">'
    puts "<body>"
    
  end
  
  def print_footer
    puts "</body>"
    puts "</html>"
  end
  
  def retrieve_data()
    response = open("http://lcboapi.com/products.json?page=2").read
    data = JSON.parse(response)
    return data["result"]
  end
  
  def retrieve_data_by_id(id)
    response = open("http://lcboapi.com/products/#{id}.json").read
    data = JSON.parse(response)
    return data["result"]
  end
  
end