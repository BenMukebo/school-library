#!/usr/bin/env ruby

require_relative 'book'
# require_relative 'people'
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

  def run 
    choose = select_options
    choose = select_options while choose < 1 || choose > 7

    case choose
    when 1
      # books_list
      puts 'first choose'
    when 2
      person_list
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      rentals_list
    when 7
    puts "Exit"
    else
      puts
    end
  end

  def select_options
    puts 'Please choose an option by entering a number: '
    options = [
      '1 - List all books',
      '2 - List all people',
      '3 - Create a person',
      '4 - Create a book',
      '5 - Create a rental',
      '6 - List all rentals for a given person id',
      '7 - Exit'
    ]
    puts
    puts options
    gets.chomp.to_i
  end

end

def main
  puts 'Welcome to School Library App!'
  puts
  app = App.new()
  app.run()
end

main()
