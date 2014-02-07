"""
Seevibes Pre-Interview Test

Pier-Luc Brault
pier-luc.brault@usherbrooke.ca

Written in Python 3
"""

import urllib.request
import json


class IMDb(object):
    """This class provides a simple API to retrieve data from IMDB."""
    
    _API_URL = "http://deanclatworthy.com/imdb/"

    def search(self, title, year=None, yearguess=False):
        url = self._API_URL + (
            "?q=" + title
            + "&yg=" + ('1' if yearguess else '0')
            + (("&year=" + str(year)) if year else "")
        )
        data = urllib.request.urlopen(url).read().decode("utf-8")
        return json.loads(data)