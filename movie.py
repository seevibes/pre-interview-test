#!/usr/local/bin/python
import os
import requests
import json
import sys

class fetchData:
	def __init__(self,title):
		parameters = {"t": title}
		self.jsonObj = None
		result = requests.get("http://www.omdbapi.com/", params=parameters).json()
		if result["Response"] == "True":
			self.jsonObj = result
		else:
			print result["Error"]

	def get_title(self):
		return self.jsonObj["Title"]
	def get_year(self):
		return self.jsonObj["Year"]

if __name__ == "__main__":
	movie = fetchData(sys.argv[1:])
	if movie.jsonObj is not None:
		print("Title: " + movie.get_title())
		print("Year: " + movie.get_year())
