"""
Seevibes Pre-Interview Test

Pier-Luc Brault
pier-luc.brault@usherbrooke.ca

Written in Python 3
"""

import sys
from imdb import IMDb

partial_title = ""
if len(sys.argv) < 2:
    print("Partial movie title : ")
    partial_title = input()
else:
    partial_title = sys.argv[1] # argument 0 is always the script name

imdb = IMDb()
imdb_data = imdb.search(partial_title)

print("Title:", imdb_data["title"])
print("Year:", imdb_data["year"])