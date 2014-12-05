require "rubygems"
require "net/http"
require "json"

def fetch_movie_json(movie_name)
  url = URI.parse("http://www.omdbapi.com/?t=#{movie_name}&r\=json")
  req = Net::HTTP::Get.new(url.to_s)
  res = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
  res.body
end

movie_name = ARGV.join("+")
movie_json = fetch_movie_json(movie_name)
movie = JSON.parse(movie_json)

puts movie.has_key?("Error") ? "No movie found." : "Title: #{movie['Title']}\nYear: #{movie['Released']}"
