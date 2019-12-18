class Book

  attr_reader :title, :author, :publication_year
  attr_accessor :num_times_checked_out

  def initialize(attributes)
    @title = attributes[:title]
    @author = attributes[:author_first_name] + " " + attributes[:author_last_name]
    year = attributes[:publication_date].split(" ")
    @publication_year = year.last
    @num_times_checked_out = 0
  end
end
