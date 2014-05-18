#!/usr/bin/env ruby

# seevibes_pretest.rb
require_relative 'IMDBInfoGetter'

# Request the data corresponding to the received movie name and display it
if !ARGV[0].nil?
  imdb_getter = IMDBInfoGetter.new(ARGV[0])
  imdb_getter.display
# Simply tell the user to pass a parameter if nothing was received in ARGV
else
print <<"EOF"
You need to send a partial movie name.
Example usage :
ruby seevibes_pretest.rb batman
EOF
end