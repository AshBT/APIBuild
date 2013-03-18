# Access parameters passed into the app by using ARGV

require_relative "html_generator"

if ARGV.empty?
  puts "Usage: bla bla bla"
else
  puts "you definitely passed some arguments"
  generator = HtmlGenerator.new
  if ARGV[0] == "index"
    puts "Action: index"
  elsif ARGV[0] == "show"
    generator.show
  else 
    puts "unrecognized action"

  end
  
end