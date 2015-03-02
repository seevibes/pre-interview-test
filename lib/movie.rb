class Movie
  def initialize(args={})
    @title = args[:title]
    @year = args[:year]
  end

  def to_s
    "Title: #{@title}\nYear: #{@year}"
  end
end
