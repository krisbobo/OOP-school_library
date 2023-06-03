require_relative 'book'
require_relative 'person'
require 'date'

class Rental
  attr_accessor :date, :person, :book
  attr_reader :rentals

  def initialize(date, person, book)
    @date = date

    @person = person
    person.rentals.push(self)

    @book = book
    book.rentals.push(self)
  end
end
