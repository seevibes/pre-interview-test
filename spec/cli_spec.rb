require 'seevibes'

describe Cli do
  describe "#search" do
    it "should return title and year" do
      expect(%x( seevibes search batman )).to eq("Title: Batman\nYear: 1989\n")
    end
  end
end