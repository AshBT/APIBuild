# Access parameters passed into the app by using ARGV

require "json"
require_relative "html_generator"

if ARGV.empty?
  puts "Usage: no arguments passed"
else
  generator = HtmlGenerator.new
  if ARGV[0] == "index"
    generator.index
  elsif ARGV[0] == "show"
    generator.show
  else 
    puts "unrecognized action"

  end
  
end