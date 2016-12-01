//API
var getMovie = require('./imdb.js');

//Require module to obtain input from Cli
var prompt = require('prompt');

var schema = {
    properties: {
        search: {
            pattern: /^[a-zA-Z]+$/,
            message: 'Name must be only letters, spaces, or dashes',
            required: true
        }
    }
};

prompt.start();
console.log('Welcome Cli-IMDB search!\n');
console.log('Enter a movie title you would like to search for.');
console.log('No spaces, numbers or dashes!\n');


prompt.get(schema, function(err, result) {
     
     if(err){
         console.log(err);
     }
     else {
     
         getMovie(result.search)
         .then(movie => {
             console.log(`\nTitle: ${movie.Title}\nYear: ${movie.Year}`);
         });
    }
});

