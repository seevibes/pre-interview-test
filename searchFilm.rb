require_relative 'search'


v1 = ARGV[0]
client = Search.new(v1)
result =  client.getText()
puts "Title : " + result["Title"]
puts "Year : " + result["Year"]