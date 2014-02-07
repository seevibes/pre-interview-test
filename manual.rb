#!/usr/bin/env ruby

require 'rest-client'
require 'json'

if ARGV.size < 1
  puts 'manual.rb <title>'
  puts '    title: partial title of a movie'
  exit 1
end

name = ARGV.join(' ')

res = JSON.parse RestClient.get('http://www.imdb.com/xml/find', {params: {json: 1, tt: 'on', q: name}, accept: :json })

if res.any?
  movie = res['title_popular'].first

  title = movie['title']
  year = movie['description'][/^\d{4}/]

  puts "Title: #{title}"
  puts "Year: #{year || 'could not find a year :('}"
else
  puts "Could not find anything related to #{name}"
end
