class HtmlGenerator
  
  def show
    puts "Action: Show"
    print_header
    print_footer
  end
  
  def index
    puts "Action:  Index"
    print_header
    print_footer
  end
  
  private
  
  def print_header
    puts "<html>"
    puts "    <head>"
    puts "      <title>Conoisseur in the head</title>"
    puts "        "
    puts "    </head>"
    puts "    <body>"
  end
  
  def print_footer
    puts "    </body>"
    puts "</html>"
  end
  
end