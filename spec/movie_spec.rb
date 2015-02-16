require 'movie'

describe Movie do
  before(:each) do
    @movie = Movie.new("Batman (1989)")
  end

  describe "#initialize" do
    it "should return title" do
      expect(@movie.title).to eq("Batman")
    end
    it "should return year" do
      expect(@movie.year).to eq("1989")
    end
  end
end