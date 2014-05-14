import sys
from lxml import html
import requests
import string

contenu = requests.get('http://www.imdb.com/find?q='+ sys.argv[1])
parse = html.fromstring(contenu.text)
title = parse.xpath('//td[@class="result_text"]/a/text()')
year = parse.xpath('//td[@class="result_text"]/text()')

yearParse = []
[yearParse.append(s) for s in year[1] if s.isdigit()]

print('Title: ' + title[0])
print('Year: ' + "".join(yearParse))

