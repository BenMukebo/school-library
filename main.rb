require_relative './app'

def main
  app = App.new
  puts 'Welcome to School Library App!'
  puts
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
    puts options
    gets.chomp.to_i
  end

  def run # rubocop:todo Metrics/CyclomaticComplexity
    choose = select_options
    choose = select_options while choose < 1 || choose > 7
    case choose
    when 1
      app.books_list
      puts 'first choose'
    when 2
      app.person_list
    when 3
      app.create_person
    when 4
      app.create_book
    when 5
      create_rental
    when 6
      app.rentals_list
    when 7
      puts 'Thank you for using the app!'
      exit
      # else
      #   puts 'Choose a number between 1 to 7'
    end
  end
end

main.run()
