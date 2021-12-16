require 'date'

class Rental
  attr_accessor :date
  attr_accessor :book
  attr_accessor :person
  
  def initialize(date = DateTime.now())
    @date = date
  end
end