require 'cgi'
require 'net/http'
require 'json'

class ImdbSearcher

  QUERY_URL = "http://www.imdb.com/xml/find?json=1&nr=1&tt=on&q=%s"

  def initialize(query)
    @query = query
  end

  def fetch_results
    response = Net::HTTP.get_response(URI.parse(url))
    if response.is_a?(Net::HTTPSuccess)
      body = JSON.parse(response.body)
      results_array = []
      for key in body.keys do
        body[key].each {|movie| results_array.push(parse_movie(movie))}
      end
      results_array
    else
      nil
    end
  end

  private

  def url
    sprintf(QUERY_URL, CGI::escape(@query))
  end

  def parse_movie(movie)
    {
      :title => CGI.unescapeHTML(movie["title"]),
      :year => movie["title_description"].to_i
    }
  end
end
