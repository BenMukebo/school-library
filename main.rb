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

  # 2 - List all people'
  def person_list
    @persons.each {|individual| puts(individual[:display])}
    run
  end

  # '3 - Create a teacher',
  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, name, age)
    # binding.pry
    @persons.push({:display => "[Teacher] Name: #{name}, ID: #{teacher.id} Age: #{age}", :object => teacher})
    # @persons.push({"Teacher" => Teacher.new(specialization, age, name)})
    puts 'create teacher'
  end

  # '3 - Create a student',
  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp != 'n'
    # binding.pry
    student = Student.new(name, age, parent_permission)
    @persons.push({:display => "[Student] Name: #{name}, ID: #{student.id} Age: #{age}", :object => student})
    puts 'create student'
  end

  # '3 - Create a person',
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = 0

    person_type = gets.chomp while person_type != '2' && person_type != '1'

    case person_type
    when '1'
      create_student

    when '2'
      create_teacher
    end
    puts 'Person created successfully'
    puts
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

  # '5 - Create a rental',
  def create_rental
    puts 'Select a book from the following list by number: '
    @books.each_with_index do |book, index|
      puts "#{index}) #{book[:output]}"
    end
    book_selected = Integer(gets.chomp)
    book_chosen = @books[book_selected][:object]

    puts 'Select a person from the following list by number (not id): '
    @person_array.each_with_index do |person, index|
      puts "#{index}) #{person[:output]}"
    end
    person_selected = Integer(gets.chomp)
    person_chosen = @person_array[person_selected][:object]

    print 'Date: '
    rental_date = gets.chomp

    @rental_array.push(Rental.new(rental_date, book_chosen, person_chosen))
  end


    # '6 - List all rentals for a given person id',


end



def main
  puts 'Welcome to School Library App!'
  puts
  app = App.new()
  app.run()
end

main()