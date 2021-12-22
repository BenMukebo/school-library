class Loader
  def load_person_from_file(persons)
    if File.exist?('./json/people.json')
      JSON.parse(File.read('./json/people.json')).each do |person|
        persons << person
      end
    else
      persons = []
    end
  end

  def load_books_from_file(books)
    if File.exist?('./json/books.json')
      JSON.parse(File.read('./json/books.json')).each do |book|
        books << book
      end
    else
      books = []
    end
  end

  def load_rentals_from_file(rentals)
    if File.exist?('./json/rentals.json')
      JSON.parse(File.read('./json/rentals.json')).each do |rental|
        rentals << rental
      end
    else
      rentals = []
    end
  end
end
