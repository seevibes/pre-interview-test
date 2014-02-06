#!/usr/bin/perl

use strict;
use LWP::Simple; # For downloading

# Webpage returned by the imdb API for the movie passed in first argument
my $webpage = 'http://www.imdb.com/xml/find?xml=1&nr=1&tt=on&q=' . join("+", @ARGV);
my $html = get $webpage or die "Web page dosen't exists";

# Functions only for the first movie returned
print "Title: $1\n" if($html =~ /">((\w|\s)*)<Description>/);
print "Year: $1\n" if($html =~ /Description>\w*([0-9]{4})/);

# I would have used XML::Parser,
# but I have to admit that I
# had problems making it work.
# Sloppy solution, but works fine
