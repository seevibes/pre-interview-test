#!/usr/bin/python

# ----------------------------------------------------------------
# File: Search.py
# Usage: Python Search.py [argv[1]] ... [arg[n]]
# Author: Simon Drouin
# Description: Merci d'installer IMDBpy en local avec la commande suivante :
#    python setup.py install
#  Le dossier se trouve a l'url suivante :
#    http://imdbpy.sourceforge.net/downloads.html
#  Il me fera plaisir de vous envoyer une version en virtual environment si desire.
#  SD.
# ----------------------------------------------------------------

__author__ = 'SimonDrouin'

import imdb
import sys

# Did the parsing myself.
#import getopt

def search(argv):
    ia = imdb.IMDb() # by default access the web.

    results = ia.search_movie(argv) # list of objects

    # For more informations on the movie...
    #ia.update(results[0])

    print results[0].summary()
    return 1

def main(argv):
    argv_length = len(sys.argv)

    if argv_length  < 2:
        print("Entrez le nom du film.")
        return 2

    else:
        argv_parse = ""

        i = 1
        while i < argv_length:      # Parsing arguments
            argv_parse += str(argv[i]) + " "
            i += 1

        try:
            search(argv_parse)
            return 1

        except Exception:
            print >> sys.stderr, Exception.msg
            return 2


if __name__ == "__main__":
    sys.exit(main(sys.argv))
    pass

