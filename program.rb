#!/usr/bin/env ruby
require "cgi"
require "net/http"
require "json"

if ARGV.count >= 1
  search = CGI::escape(ARGV.join(' ').strip)
  url = "http://www.imdb.com/xml/find?json=1&q="+search
  result = Net::HTTP.get_response(URI.parse(url)).body
  data = JSON.parse(result)["title_popular"]

  if data.nil? == false
    puts "Title: "+data.first["title"]
    puts "Year: "+data.first["title_description"].to_i.to_s
  else
    puts "No result found"
  end

else
  puts "Argument missing"
end
