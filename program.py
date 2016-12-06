#!/usr/bin/python
# -*- coding: utf-8 -*-

# File Name: program.py
# Author: Akira Kakkar
# Python Version: 2.7

from imdb import IMDb
import sys

def split_title_year(movie):
    title_year = movie['long imdb canonical title']
    year = title_year.split(' ')[-1][1:-1]
    title = ' '.join(title_year.split(' ')[:-1])
    if title[0] == '"':
        title = title[1:-1]
    return title, year

def extract_movies(keyword, nums):
    movies_list = []
    ia = IMDb()
    movies = ia.search_movie(keyword)
    updated = nums
    if nums >= len(movies):
        updated = len(movies)
    for item in movies[0:updated]:
        movies_list.append(split_title_year(item))
    return movies_list

def print_movies(list_movies):
    for movie in list_movies:
        print "Title: " + movie[0]
        print "Year: " + movie[1] + '\n'

if __name__ == '__main__':
    if (len(sys.argv)) == 3:
        nums = sys.argv[2]
        if not nums.isdigit():
            print "Second argument needs to be a positive integer"
            while(not nums.isdigit() and int(nums) <= 0):
                nums = raw_input("How many outputs? ")
        nums = int(nums)
        keyword = sys.argv[1]
    elif (len(sys.argv)) == 2:
        nums = 1
        keyword = sys.argv[1]
    else:
        nums = 1
        keyword = raw_input("Type keyword for search? ")
    movie_list = extract_movies(keyword, nums)
    print_movies(movie_list)
