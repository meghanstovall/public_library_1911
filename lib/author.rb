require './lib/book'

class Author

  attr_reader :name, :books

  def initialize(attributes)
    @name = attributes[:first_name] + " " + attributes[:last_name]
    @books = []
  end

  def write(title, publication_date)
    word_list = @name.split(" ")
    book = Book.new({author_first_name: word_list.first, author_last_name: word_list.last, title: title, publication_date: publication_date})
    @books << book
    book
  end
end
