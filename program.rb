require 'net/http'
require 'rexml/document'

if ARGV.length != 1 && ARGV.length != 2
	abort("Error! Expected 1 parameter, received " + ARGV.length.to_s + ".")
else
	input = ARGV[0]
end
count = -1
if ARGV.length == 2
	begin  
		count = Integer(ARGV[1]) - 1
	rescue
		count = -1
	end
end
url = 'http://www.omdbapi.com/?s='+ input +'&r=xml';
xml_data = Net::HTTP.get_response(URI.parse(URI.encode(url)))
if xml_data.is_a?(Net::HTTPSuccess);
	doc = REXML::Document.new(xml_data.body)
	if(doc.root.attributes['response'] == 'False')
		puts 'No data found!' 
	else
		title = []
		year = []
		doc.elements.each('*/result') do |ele|
			title << ele.attributes["title"]
	   		year << ele.attributes["year"]
		end 
		if(count == -1 || count > title.size()-1)
			count = title.size()-1
		end
		for i in 0..count
			puts title[i] + ', ' + year[i]
		end
	end
else
	abort("Error! Unable to etablish the connection")
end
