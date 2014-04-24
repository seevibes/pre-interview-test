require "net/http"
require "json"

def find_movie(title)
  uri = URI.parse("http://www.omdbapi.com/?t=#{title}&r=JSON")

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)

  response = http.request(request)

  response.code             
  response.body            


  @events = (JSON.parse(response.body))

  puts "Title: #{@events["Title"]}"
  puts "Year: #{@events["Year"]}"
  
end

puts "What movie do you want to search?"
title = gets.chomp
find_movie(title)