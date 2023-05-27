require_relative 'book'
require_relative 'person'

class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
    book.add_rental << self
    person.add_rental << self
  end

  def to_s
    "Rental Date :#{date.strftime('%Y-%m-%d %H:%M:%S')},
    Book Details: #{book.title} written by #{book.author}
    Person: #{person.name} is Age:#{person.age} years old"
  end
end

# person.add_rental(self) # Add the rental to the person's rentals
# book.add_rental(person, self) # Add the rental to the book's rentals
