require 'omdbapi'

unless ARGV.empty?
  begin
    hash = OMDB.title(ARGV.join(' '))  
    %w(year title).each do |key|
      puts "#{key.capitalize}: #{hash[key.to_sym]}"
    end
  rescue SocketError
    puts "Woops, there was an error while contacting the IMDB database :("
  end
else
  puts "You must enter a movie title."
end
