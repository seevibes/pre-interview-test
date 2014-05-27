/*
 *	
 *	@date: 				22/05/14
 *	@author: 			John Béjot, UQAM Computer-Science student
 *	@email: 			bejot.john@courrier.uqam.ca
 *	@description: 		Pre-interview test for Seevibes.
 *						This program will connect to an IMDB API and return the year of release and full title 
 *						of a movie, based on it's partial name given on the command line.		
 *	@API: 				Since IMDB does not have an official API, this program uses http://deanclatworthy.com/imdb/
 *	@context: 			Application written in JavaScript and to be executed with Node.JS
 *
 */

var args = process.argv,
	XMLHttpRequest = require("xmlhttprequest").XMLHttpRequest;

// This program is meant to be executed with Node.JS
if (args.length < 3) {
	console.log("Error, the command must be formatted as such : node seevibes.js <movie_title>");
}
else {
	var xhr = new XMLHttpRequest(),
		title = "";

	// In case multiple words are entered for the title name
	for (var i = 2, l = args.length ; i < l ; i++)
		title += args[i];

	var req = "http://deanclatworthy.com/imdb/?q=" + title + "&yg=0";

	xhr.open('GET', req);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var movie = JSON.parse(xhr.responseText);

			if (movie.error) {
				console.log("Error, the movie you are looking for doesn't seem to exist in the database : " + title);
			}
			else {
				console.log("Title : " + movie.title);
				console.log("Year : " + movie.year);
			}
		}
	}
	xhr.send(null);
}
