# require 'date'

class Rental
  attr_accessor :date, :book, :person

  # attr_reader :person, :book

  def initialize(book, person, date)
    @book = book
    @person = person
    @date = date

    book.rentals << self
    person.rentals << self
  end

  # def book=(book)
  #   @book = book
  #   book.add_rental(self)
  # end

  # def person=(person)
  #   @person = person
  #   person.add_rental(self)
  # end
end
