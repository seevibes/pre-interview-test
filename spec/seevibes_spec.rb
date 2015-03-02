require 'spec_helper'
require_relative '../lib/movie'

describe 'Movie#to_s' do
  it "returns the title and year on two lines" do
    movie = Movie.new({:title=>"Fargo", :year=>1996})
    expect("#{movie}").to eq "Title: Fargo\nYear: 1996"
  end
end