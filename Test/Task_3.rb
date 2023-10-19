class Book
  def initialize(title, author, year_publication)
    @title = title
    @author = author
    @year_publication = year_publication
  end

  def set_title(title)
    @title = title
  end

  def get_title
    "Title: #{@title}"
  end

  def set_author(author)
    @author = author
  end

  def get_author
    "Author: #{@author}"
  end

  def set_year(year_publication)
    @year_publication = year_publication
  end

  def get_year
    "Year publication: #{@year_publication}"
  end

  def info_book
    "Title: #{@title}
Author: #{@author}
Year publication: #{@year_publication}"
  end
end

book_1 = Book.new("IT", "Stephen King", 1986)
puts(book_1.info_book)
book_1.set_year(1977)
book_1.set_title("Shining")
puts
puts(book_1.info_book)