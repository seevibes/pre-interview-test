require 'spec_helper'
require_relative '../lib/movie'
require_relative '../lib/imdb_searcher'

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

