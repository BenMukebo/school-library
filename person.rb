require_relative('./corrector')
require_relative('./rental')

class Person
  attr_accessor :name, :age
  attr_reader :id, :rentals, :parent_permission

  DEFAULT_PERM = true
  def initialize(age, name = 'Unknown', parent_permission = DEFAULT_PERM)
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

  def add_rental(book, date)
    Rental.new(book, self, date)
  end

  private

  def of_age?
    @age >= 18
  end
end
