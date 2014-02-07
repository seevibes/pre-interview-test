#!/usr/bin/env ruby

# This implementation is done by quote on quote cheating. I am using a gem that does all the searching for me. This
# makes my life very easy, but doesn't really show my coding abilities.

require 'imdb'

if ARGV.size < 1
  puts 'usage: cheating.rb <title>'
  puts '    title: partial title of a movie'
  exit 1
end

name = ARGV.join(' ')

res = Imdb::Search.new(name)
movie = res.movies.first

# the gem gives us the name with the date in it. Remove it since we don't need it.
if movie
  title = movie.title.gsub(/\(\d{4}\)$/, '').rstrip
  puts "Title: #{title}"
  puts "Year: #{movie.year}"
else
  puts "Could not find anything related to: #{name}"
end