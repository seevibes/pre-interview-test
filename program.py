#!/usr/bin/env python
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
    count = 0
    for item in movies:
        if count >= updated:
            break
        title, year = split_title_year(item)
        if keyword.lower() in title.lower():
            movies_list.append((title, year))
            count += 1

    return movies_list

def print_movies(list_movies):
    for movie in list_movies:
        print "Title: " + check_the(movie[0])
        print "Year: " + movie[1] + '\n'

def check_the(movie_title):
    split = movie_title.split(',')
    if len(split) == 2 and split[1] == ' The':
        return split[1][1:] + ' ' + split[0]
    return movie_title

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
        keyword = ""
        while(not keyword):
            keyword = raw_input("Type keyword for search? ")
    movie_list = extract_movies(keyword, nums)
    print_movies(movie_list)
