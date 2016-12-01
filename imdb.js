//Required node module for promise
var request = require('request');

//Request promise to obtain JSON file from a url
function requestPromise(url) {
    return new Promise(function(resolve, reject) {
        request(url, function(err, result) {
            if (err) {
                console.log("ERROR obtaining JSON file");
            }
            else {
                resolve(result);
            }
        });
    });
}

//Call to the IMDB API
function getMovie(searchTitle) {
   return (
        requestPromise(`http://www.omdbapi.com/?s=${searchTitle}`)
        .then(function(response) {
            var searchResponse = JSON.parse(response.body);
            return searchResponse.Search[0];
        })
    );
}

module.exports = getMovie;