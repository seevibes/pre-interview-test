#!/usr/bin/env node

//Handle the http request
var request = require('request');


request('http://www.omdbapi.com/?t='+ process.argv[2], function (error, response, body) {
  if (!error && response.statusCode == 200) {
    
    var infos = JSON.parse(body);
    console.log('Title: ' + infos.Title);
    console.log('Year: ' + infos.Year);

  }
});




