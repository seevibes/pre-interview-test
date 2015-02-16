require 'imdb'
require 'thor'

class Cli < Thor
  desc 'search <partial movie name>', 'search for a movie by partial name'
  def search partial_name
    i = Imdb::Search.new(partial_name)
    movie = Movie.new(i.movies.first.title)
    puts "Title: #{movie.title}"
    puts "Year: #{movie.year}"
  end
end