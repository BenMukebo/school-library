require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'

class App
  attr_accessor :books, :persons, :rentals

  def initialize
    @persons = []
    @books = []
    @rentals = []
  end
end

def main
  puts 'Welcome to School Library App!'
  puts
  app = App.new()
  app.run()
end

main()
