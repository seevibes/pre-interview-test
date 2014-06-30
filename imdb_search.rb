#!/usr/bin/env ruby

require 'net/http'
require 'json'

title = ARGV.join(' ').to_s

uri = URI('http://www.omdbapi.com/')
uri.query = URI.encode_www_form(:t => title)

res = Net::HTTP.get_response(uri)
movie = JSON.parse(res.body)

if res.is_a?(Net::HTTPSuccess)
  puts "Title: #{movie['Title']}"
  puts "Year: #{movie['Year']}"
end
