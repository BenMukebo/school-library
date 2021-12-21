require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  # 1 - list all books
  def books_list
    if @books.length.positive?
      @books.each do |book|
        puts " Title: #{book.title}, Author: #{book.author}"
      end
    else
      puts 'No books added yet!'
    end
  end

  # 2 - List all people'
  def person_list
    @persons.each do |individual|
      # binding.pry
      puts "[#{individual.class}] Name: #{individual.name}, Age: #{individual.age}"
    end
  end

  # '3 - Create a teacher',
  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp

    @persons << Teacher.new(specialization, name, age)
    puts 'create teacher'
  end

  # '3 - Create a student',
  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp != 'n'

    @persons << Student.new(name, age, parent_permission)
    puts 'create student'
  end

  # '3 - Create a person',
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = 0

    person_type = gets.chomp while person_type != '2' && person_type != '1'

    case person_type
    when '1'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp

      create_student(age, name)

    when '2'
      print 'Age: '
      age = gets.chomp
      print 'Name: '
      name = gets.chomp

      create_teacher(age, name)
    end
    puts 'Person created successfully'
    puts
  end

  # '4 - Create a book',
  def create_book(title, author)
    @books << Book.new(title, author)
    puts('Book created successfully!')
  end

  def book_data
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp

    create_book(title, author)
  end

  # '5 - Create a rental',

  def handled_rental(selected_book, selected_person, selected_date)
    @rentals << Rental.new(@books[selected_book], @persons[selected_person], selected_date)

    puts('Rental created')
    puts
  end

  def create_rental
    if @books.length.positive? && @persons.length.positive?
      puts
      puts('Select a book from the following list by number')

      @books.each_with_index { |book, index| puts("#{index}) Title: #{book.title} Author: #{book.author}") }
      puts
      selected_book = gets.chomp.to_i

      puts('Select a user from the following list by number(not id)')
      @persons.each_with_index do |person, index|
        puts("#{index}) [#{person.class}]  Name: #{person.name}  ID: #{person.id}  Age: #{person.age}")
      end
      selected_person = gets.chomp.to_i

      print('Date: ')
      selected_date = gets.chomp.to_s
      puts

      handled_rental(selected_book, selected_person, selected_date)
    else
      puts 'No books or no persons yet!'
    end
  end

  # '6 - List all rentals for a given person id',
  def rentals_list
    puts('Rentals: ')
    puts
    print('ID of person: ')
    selected_id = gets.chomp.to_i
    puts('Rentals: ')

    @rentals.each do |rental|
      # binding.pry
      next unless rental.person.id == selected_id

      puts
      puts("Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}")
      puts
    end
  end
end
