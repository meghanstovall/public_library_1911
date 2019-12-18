class Library

  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    @books = @authors.map {|author| author.books}.flatten
  end

  def publication_time_frame_for(author)
    publication_years = author.books.map {|book| book.publication_year.to_i}
    min_date = publication_years.min
    max_date = publication_years.max
    time_frame = {start: min_date.to_s, end: max_date.to_s}
  end
end
