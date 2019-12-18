class Library

  attr_reader :name, :books, :authors, :checked_out_books

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out_books = []
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

  def checkout(book)
    if @books.include?(book)
      book.num_times_checked_out += 1
      @checked_out_books << @books.delete(book)
      true
    else
      false
    end
  end

  def return(book)
    @books << @checked_out_books.delete(book)
  end

  def most_popular_book
    checked_out_nums = @checked_out_books.map do |book|
      book.num_times_checked_out
    end
    max = checked_out_nums.max

    @checked_out_books.find {|book| book.num_times_checked_out == max}
  end
end
