import json
import urllib2
import sys

request = "http://www.omdbapi.com/?t={}&y=&plot=short&r=json"
formatted_request = request.format(sys.argv[1])

data = json.load(urllib2.urlopen(formatted_request))


title = data['Title'].encode('UTF-8')
year = data['Year'].encode('UTF-8')

print("Title: {}\nYear: {}".format(title, year))
