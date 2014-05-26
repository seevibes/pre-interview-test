import sys
import urllib2

def main(argv):
	version = sys.version
	if not '2.7' in version:
		print "This script requires Python 2.7"
		sys.exit()

	title = ''
	if argv:
		#The search can be refined by adding other parts of the title
		for title_part in argv:
			title += str(title_part) + '%20'
	else:
		title = 'batman%20begins%'

	url = "http://www.omdbapi.com/?t=%s" %title
	r = urllib2.urlopen(url)
	content =  r.read()

	#Luckily, the JSON format looks exactly like a python dictionary
	#So we convert the string to dictionary
	c = eval(content)

	#Quick check if the content we're looking for is there
	if 'Title' in c:
		print 'Title: ', c['Title']
		print 'Year: ', c['Year']
	else:
		print "Movie was not found"

if __name__ == '__main__':  
	main(sys.argv[1:])