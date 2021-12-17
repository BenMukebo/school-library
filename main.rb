#!/usr/bin/env ruby
require 'pry'

require_relative './book'
# require_relative './people'
require_relative './teacher'
require_relative './student'
require_relative './rental'

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
      books_list
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
      puts 'Thank you for using the app!'
      exit
    else
      puts 'Choose a number between 1 to 7'
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

  # 1 - list all books
  def books_list
    # @books.each { |book| puts "Title: '#{book.title}', Author: #{book.author}" }
    # puts books
    @books.each do |book|
      puts book[:output]
    end
    run
  end

  # '4 - Create a book',
  def create_book
    print 'Title: '
    book_title = gets.chomp
    print 'Author: '
    book_author = gets.chomp

    book = Book.new(book_title, book_author)
    @books.push({
                  output: "Title: #{book.title}, Author: #{book.author}",
                  object: book
                })

    # @books.push(Book.new(book_title, book_author))
     puts 'Book created successfully'
     puts
     run
  end
end



def main
  puts 'Welcome to School Library App!'
  puts
  app = App.new()
  app.run()
end

main()