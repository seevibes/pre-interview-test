#!/usr/bin/ruby

require 'net/http'
require 'uri'
require 'json'

name = ARGV[0]

# if there is no movie in the entry, the error message show up
if (!name.nil?)
	# the uri to get the movie information from the open movie data base api https://www.omdbapi.com/
	# the parameter s fetch a list of movies associte to the name
	uri = URI('http://www.omdbapi.com/?s=' + name +'&y=&r=json')
	res = Net::HTTP.get(uri)
	# Parsing the response in a json object
	json = JSON.parse(res)
	# I take the first movie from the list of movies
	puts "Title: " + json["Search"][0]["Title"]
	puts "Year: " +json["Search"][0]["Year"]
else
	puts "no argument"
end
