#!/usr/bin/env ruby
require_relative 'lib/movie'
require_relative 'lib/imdb_searcher'
require_relative 'lib/command_line_interface'

if ARGV.empty?
  abort "usage: /.seevibes.rb <partial movie name>"
else
  query = ARGV.join(' ').strip
  cli = CommandLineInterface.new({
    :result_class => Movie,
    :searcher_class => ImdbSearcher,
    :results_limit => 1
  })
  cli.search query
end
