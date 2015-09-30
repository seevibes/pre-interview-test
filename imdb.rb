#Programme par: Alexis Caron, Université de Sherbrooke

require "json"
require "open-uri"

#Vérification du nombre d'argument reçu
if ARGV.length < 0 
	film = ARGV[0]
else 
	puts "Erreur: Aucun argment recu. Veuillez entrez un terme de recherche :"
	film = gets.chomp
end 

#Requête du film sur OMDB
lien = "http://www.omdbapi.com/?s=" + film + "&type=movie&r=json"
json = open(lien).read
resultat = JSON.parse(json)
lesFilmes = resultat["Search"]

#Vérification du résultat de OMDB
if lesFilmes.nil?
	sortie = "Erreur: Aucun film avec un nom correspondant au terme de recherche."
else
	premierFilm = lesFilmes[0]
	sortie = "Title: " + premierFilm["Title"] + "\nYear: " + premierFilm["Year"]
end

#Affichage du résultat
puts sortie