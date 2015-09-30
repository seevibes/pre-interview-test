#Programme par: Alexis Caron, Universit� de Sherbrooke

require "json"
require "open-uri"

#V�rification du nombre d'argument re�u
if ARGV.length > 0 
	film = ARGV[0]
else 
	puts "Erreur: Aucun argument recu. Veuillez entrez un terme de recherche :"
	film = gets.chomp
end 

#Requ�te du film sur OMDB
lien = "http://www.omdbapi.com/?s=" + film + "&type=movie&r=json"
json = open(lien).read
resultat = JSON.parse(json)
lesFilmes = resultat["Search"]

#V�rification du r�sultat de OMDB
if lesFilmes.nil?
	sortie = "Erreur: Aucun film avec un nom correspondant au terme de recherche."
else
	premierFilm = lesFilmes[0]
	sortie = "Title: " + premierFilm["Title"] + "\nYear: " + premierFilm["Year"]
end

#Affichage du r�sultat
puts sortie