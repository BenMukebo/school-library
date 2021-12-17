require_relative('./corrector')

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  # attr_accessor :name, :age, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @validate = Corrector.new
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name
    @name = validate.correct_name(@name)
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  # def add_rental(rental)
  #   @rentals.push(rental) unless @rentals.include?(rental)
  #   rental.person = self
  # end

  private

  def of_age?
    @age >= 18
  end
end

# person = Person.new(name: 'ben', age: 34, parent_permission: true)

# puts person.can_use_services?
