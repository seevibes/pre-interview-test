var omdb = require('omdb');
var movie = '';

process.argv.forEach(function(val, index, array) {
	if(index > 1)
		movie = movie.concat(' ').concat(val);	
});

omdb.search(movie, function(err, movies) {
    	if(err) {
        	return console.error(err);
    	}

    	if(movies.length < 1) {
       		return console.log('No movies were found!');
    	}

	console.log('Title: ', movies[0].title);
	console.log('Year: ', movies[0].year);
});
