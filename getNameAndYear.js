var request = require('request');

var url = "http://www.omdbapi.com/?s=" + process.argv[2] + "&y=&plot=short&r=json";

request(url, function (error, response, body) {
  if (!error && response.statusCode == 200) {
    var movie = JSON.parse(body).Search[0];
    console.log('Title: ' + movie.Title)
    console.log('Year: ' + movie.Year)
  }
});

