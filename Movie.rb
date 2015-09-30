#===============================
#=Author: Samuel Sideleau	=
#=Date: 2015/30/09		=
#===============================
require "open-uri"
require "json"

def printMovie(jsonObj,key)
	puts "Title: " + jsonObj[key][0]["title"] 	#print title
	#print year (there is no year field but it's always the 4 first characters of title_description)
	puts "Year: " + jsonObj[key][0]["title_description"][0, 4]
	return 0
end

#Get arg
if ARGV.length > 0 
	nom_film = ARGV[0]
else 
# if 0 arg show error message
	puts "Error: Please enter a search term"
	puts "Usage: ruby Program search_term"
	exit
end 

imdb_search_url = "http://www.imdb.com/xml/find?json=1&nr=1&tt=on&q=" + nom_film #request imdb API
json = open(imdb_search_url).read	#get json file

obj = JSON.parse(json)			#parse json object


if obj.has_key?("title_popular")	#if movie is found and is popular
	printMovie(obj,"title_popular")
elsif obj.has_key?("title_exact")	#if movie is found
	printMovie(obj,"title_exact")	
else
	puts "Can not find a movie with this name."
end



