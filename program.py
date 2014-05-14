import sys
from lxml import html
import requests
import string

#Get the page from imdb with the research
contenu = requests.get('http://www.imdb.com/find?q='+ sys.argv[1])
#Parse to xml :
parse = html.fromstring(contenu.text)
#Get the text between <td class="result_text"><a> and </a></td>
title = parse.xpath('//td[@class="result_text"]/a/text()')
#Get the text between <td class="result_text"> and </td>
year = parse.xpath('//td[@class="result_text"]/text()')

#Remove the space and '(' from the string of the year
yearParse = []
[yearParse.append(s) for s in year[1] if s.isdigit()]


print('Title: ' + title[0])
#Merge the digits from the list
print('Year: ' + "".join(yearParse))