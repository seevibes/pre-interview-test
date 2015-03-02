require 'spec_helper'
require_relative '../lib/movie'
require_relative '../lib/imdb_searcher'
require_relative '../lib/command_line_interface'

describe 'Movie#to_s' do
  it "returns the title and year on two lines" do
    movie = Movie.new({:title=>"Fargo", :year=>1996})
    expect("#{movie}").to eq "Title: Fargo\nYear: 1996"
  end
end

describe 'ImdbSearcher#fetch_results' do
  it "returns an array of movie results" do
    search = ImdbSearcher.new("Lost Weekend")
    expect(search.fetch_results).to be_an(Array)
  end

  it "parses movie results to hashes with title and year keys" do
    search = ImdbSearcher.new("When Harry Met Sal")
    expect( (search.fetch_results).all? {|result| result.has_key?(:title) && result.has_key?(:year) } ).to be true
  end
end

describe 'CommandLineInterface#search' do
  before do
    @generic_result_class = double("Generic result class")
    allow(@generic_result_class).to receive_messages({ :new => @generic_result_class, :to_s => "Generic result as a string"})
    
    @generic_searcher_class = double("Generic searcher class")
    allow(@generic_searcher_class).to receive_messages({:new => @generic_searcher_class, :fetch_results => [@generic_result_class, @generic_result_class]})

    @cli = CommandLineInterface.new({:result_class => @generic_result_class, :searcher_class => @generic_searcher_class, :results_limit => 1})
  end

  it "prints results to the terminal" do
    expect {@cli.search("generic search query") }.to output("Generic result as a string\n").to_stdout
  end
end
