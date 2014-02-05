require 'net/http'
require 'rexml/document'

if ARGV.length != 1
	abort("parameters error")
else
	input = ARGV[0]
end

url = 'http://deanclatworthy.com/imdb/?type=xml&yg=0&q=' + input;
xml_data = Net::HTTP.get_response(URI.parse(URI.encode(url)))
if xml_data.is_a?(Net::HTTPSuccess);
	doc = REXML::Document.new(xml_data.body)
	title = []
	doc.elements.each('movie/title') do |ele|
   		title << ele.text
	end
	year = []
	doc.elements.each('movie/year') do |ele|
   		year << ele.text
	end
	puts title
	puts year
else
	abort("Connection was not successful")
end

