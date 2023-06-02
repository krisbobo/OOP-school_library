require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.rentals.push(self)
    person.rentals.push(self)
  end

  def to_s
    "Rental Date :#{date.strftime('%Y-%m-%d %H:%M:%S')},
    Book Details: #{book.title} written by #{book.author}
    Person: #{person.name} is Age:#{person.age} years old"
  end
end
