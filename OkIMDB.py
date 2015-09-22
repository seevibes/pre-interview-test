#!/usr/bin/python3

__author__ = 'KerbKerb'

from urllib.request import *
from urllib.error import *
import json
import sys


def search_engine(keys):
    request = "http://www.omdbapi.com/?t=" + keys + "&y=&plot=short&r=json"
    data = urlopen(request).read().decode("utf8")

    informations = json.loads(data)

    if informations["Response"] == "True":
        return informations["Title"], informations["Year"]
    else:
        return None


if __name__ == "__main__":
    if len(sys.argv) == 1:
        print("'Ok IMDB' need to have at least one keyword for the search")
        exit(1)

    keyword = ""
    value = None

    for args in sys.argv[1:]:
        keyword += args + ' '

    keyword = keyword[:-1]

    try:
        value = search_engine(keyword)
    except URLError:
        print("'OK IMDB' can't reach IMDB, please check your internet connection.")
        exit(2)

    if value is None:
        print("'Ok IMDB' can't provide any movie with these keywords")
        print("Keywords: " + keyword)
    else:
        print("Title: " + value[0])
        print("Year: " + value[1])

    exit(0)
