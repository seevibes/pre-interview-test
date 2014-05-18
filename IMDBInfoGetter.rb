require "net/http"
require "rexml/document"

# Deals with the OMDB API. The only configuration available is the movie name.
class IMDBInfoGetter
  API_URL = "http://www.omdbapi.com/"

  # We need a partial movie title in order to query
  def initialize(movie_name)
    @movie_name = movie_name
    build_params
    send_query
  end

  # Display the fetched info
  def display
    puts "Title: #{@title}"
    puts "Year: #{@year}"
  end

private
    # Send query to the OMDB API using the movie title
    def send_query
      #begin
        resp = Net::HTTP.get_response(URI.parse(@final_url))
        xml_to_attributes(resp.body)
      #rescue
        #puts "An error occured while contacting the OMDB API."
      #end
    end
    
    # Convert received XML data to local attributes
    def xml_to_attributes(xml_data)
      #begin
        xml = REXML::Document.new(xml_data)
        movie = xml.root.elements["movie"]
        @title = movie.attributes["title"]
        @year = movie.attributes["year"]
      #rescue
        #puts "An error occured while parsing the OMDB API result."
      #end
    end

    # Build parameters according to API specification
    def build_params
      @params = {"t" => @movie_name, "r" => "XML"}
      params_to_query
      @final_url = "#{API_URL}?#{@query}"
    end

    # Convert the params hash to a valid query string
    def params_to_query
      arr = []
      @params.keys.size.times do |i|
        encoded = URI.encode(@params.values[i])
        arr << "#{@params.keys[i]}=#{encoded}"
      end
      @query = arr.join("&")
    end
end