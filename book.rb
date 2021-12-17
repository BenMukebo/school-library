class Book
  attr_accessor :title, :author,
  attr_reader :rentals
  # attr_accessor :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  # def add_rental(rental)
  #   @rentals.push(rental) unless @rentals.include?(rental)
  #   rental.book = self
  # end
end
