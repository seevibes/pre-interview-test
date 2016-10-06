#!/usr/bin/ruby
require 'json'
require 'open-uri'

# Will open ip the imdb api and return the title and year of our first result
def callAPI(name)
    unless name.nil?
        # I chose to use the title_popular option over the title_exact option since
        # we don't know the full title and over the title_substring since it seemed
        # to return videos related to our search term instead of movies
        json = JSON.parse(open("http://www.imdb.com/xml/find?json=1&nr=1&tt=on&q=#{name}") { |x| x.read })
        # Should do more date validation but I will assume it's always the first 4 characters
        return "Title: " + json["title_popular"][0]["title"] + "\nYear: " + json["title_popular"][0]["title_description"][0..3] unless json["title_popular"].nil?
        "No movie with the specified title"
    else
        "Please specify a movie title"
    end
end

puts callAPI(ARGV[0])
