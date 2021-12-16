require 'date'

class Rental
  attr_accessor :date
  attr_accessor :book
  
  def initialize(date = DateTime.now())
    @date = date
  end
end