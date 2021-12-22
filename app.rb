require 'json'
require_relative './book'
require_relative './teacher'
require_relative './student'
require_relative './rental'
require_relative './loaders'

class App
  def initialize
    @persons = []
    @books = []
    @rentals = []

    loader = Loader.new

    loader.load_person_from_file(@persons)
    loader.load_books_from_file(@books)
    loader.load_rentals_from_file(@rentals)
  end

  def books_list
    if @books.length.positive?
      @books.each do |book|
        puts "Title: #{book['title']}, Author: #{book['author']}"
        puts
      end
    else
      puts 'No books added yet!'
    end
  end

  def person_list
    @persons.each do |individual|
      puts "[#{individual['class_name']}],
        Name: #{individual['name']},
        ID: #{individual['id']}, Age: #{individual['age']}"
    end
  end

  def create_teacher(age, name)
    print 'Specialization: '
    specialization = gets.chomp
    new_teacher = Teacher.new(specialization, name, age)

    hash = {
      'class_name' => new_teacher.class.name,
      'name' => name,
      'age' => age,
      'specialization' => new_teacher.specialization,
      'id' => new_teacher.id
    }
    @persons << hash
    puts 'create teacher'
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp != 'n'

    new_student = Student.new(name, age, parent_permission)
    hash = {
      'class_name' => new_student.class.name,
      'name' => name,
      'age' => age,
      'parent_permission' => new_student.parent_permission,
      'id' => new_student.id
    }
    @persons << hash
    puts 'create student'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = 0

    person_type = gets.chomp while person_type != '2' && person_type != '1'

    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp

    case person_type
    when '1'
      create_student(age, name)
    when '2'
      create_teacher(age, name)
    end
    puts 'Person created successfully'
    puts
  end

  def create_book(title, author)
    new_book = Book.new(title, author)
    hash = { 'title' => new_book.title, 'author' => new_book.author }
    @books << hash
    puts('Book created successfully!')
  end

  def book_data
    print('Title: ')
    title = gets.chomp
    print('Author: ')
    author = gets.chomp

    create_book(title, author)
  end

  def handled_rental(selected_book, selected_person, selected_date)
    hash = {
      'book' => selected_book,
      'persons' => selected_person,
      'date' => selected_date
    }
    @rentals << hash

    puts('Rental created')
    puts
  end

  def create_rental
    if @books.length.positive? && @persons.length.positive?
      puts
      puts('Select a book from the following list by number')

      @books.each_with_index { |book, index| puts("#{index}) Title: #{book['title']} Author: #{book['author']}") }
      puts
      selected_book = gets.chomp.to_i
      book_name = @books[selected_book]['title']

      puts('Select a user from the following list by number(not id)')

      @persons.each_with_index do |person, index|
        puts("#{index}) [#{person['class_name']}]  Name: #{person['name']} ID: #{person['id']} Age: #{person['age']}")
      end

      selected_person = gets.chomp.to_i
      person_id = @persons[selected_person]['id']

      print('Date: ')
      selected_date = gets.chomp.to_s
      puts
      handled_rental(book_name, person_id, selected_date)
    else
      puts 'No books or no persons yet!'
    end
  end

  def rentals_list
    puts('Rentals: ')
    puts
    print('ID of person: ')
    selected_id = gets.chomp.to_i
    puts('Rentals: ')
    found_person = @persons.find { |person| person['id'] == selected_id }
    found_rental = @rentals.find { |rental| rental['persons'] == selected_id }

    if found_person && found_rental
      puts "Date: #{found_rental['date']}, Book #{found_rental['book']} by #{found_person['name']}"
    else
      puts 'ID not found'
    end
  end

  def sava_data
    File.write('./json/books.json', JSON.generate(@books)) if @books.any?

    File.write('./json/people.json', JSON.generate(@persons)) if @persons.any?

    File.write('./json/rentals.json', JSON.generate(@rentals)) if @rentals.any?
  end
end
