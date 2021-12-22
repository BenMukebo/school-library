require 'json'
require_relative('./rental')

class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(self, person, date)
  end

  def convert_to_json
    {
      'class_name' => self.class.name,
      'title' => @title,
      'author' => @author
    }.to_json
  end
end
