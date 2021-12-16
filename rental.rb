require 'date'

class Rental
  attr_accessor :date
  attr_accessor :book
  attr_accessor :person
  
  def initialize(book, person, date = DateTime.now())
    @date = date
    @book = book
    @person = person
  end
end