require 'net/http'
require 'open-uri'
require 'json'

# Created by Alex Coppens on Fri 1 May 2015 18:49:05 EDT
# example usages:
# ruby movie_titles.rb scary movie

def query_imdb(search)
  url = URI.parse("http://www.omdbapi.com/?type=movie&s=#{URI::encode(search)}")
  response = Net::HTTP.start(url.host, url.port) {|http|
    http.request(Net::HTTP::Get.new(url.to_s))
  }
  return parse_response(response.body) if response.code.to_i == 200
  puts 'Failed to query the imdb server'
end


def parse_response(res)
  results = JSON.parse(res)
  puts format_result(results['Search'][0]) unless results['Search'].empty?
end


def format_result(result)
  "Title: #{result['Title']}\nYear: #{result['Year']}"
end

search = ARGV.join(' ')
query_imdb(search)