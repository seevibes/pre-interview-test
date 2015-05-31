

#le nom du film à rechercher
if ARGV.length > 0 
	movie = ARGV[0]
else 
	puts "Write the name of a movie :"
	movie = gets.chomp
end 

require "open-uri"
require "json"

#Appel de l'api qui va retourner un json
url = "http://www.omdbapi.com/?s=" + movie + "&type=movie&plot=short&r=json"
json = open(url).read

obj = JSON.parse(json)

#Afficher le resultat
unless obj["Search"].nil?
	puts "Title: " + obj["Search"][0]["Title"] 
	puts "Year:" + obj["Search"][0]["Year"]
else
	puts "No movie with this title"
end
