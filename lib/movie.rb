class Movie
  def initialize(name)
    @name=name
    arr_title = @name.split('(')
    @title = arr_title.first.rstrip
    @year = arr_title.last.split(')').first
  end

  def title
    @title
  end

  def year
    @year
  end
end