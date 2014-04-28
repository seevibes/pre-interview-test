require 'rubygems'
require 'rest_client'
require 'json'


class Search

	@url

	def initialize(title)
		@url = "http://www.omdbapi.com/?t="+title
	end	

	# performs the GET request to get the movie from IMDB
	def searchMovie
		response = RestClient.get(@url)
        return response.body
	end	

	# returns the raw JSON of the response from IMDB
	def getJSON
        return searchMovie()
    end

    # returns a human-friendly text version of the response from IMDB
    def getText
        hashOfResponse = JSON.parse(getJSON())
        return hashOfResponse
    end


end 	
