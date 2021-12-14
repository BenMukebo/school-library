class Person
  def initialize(name = "Unknown", age, parent_permission = true)
    @name = name
    @age = age
  end

  attr_reader :id
  attr_reader :name
  attr_writer :name
  attr_reader :age
  attr_writer :age

  # def id
  #   @id
  # end

  # def name
  #   @name
  # end

  # def age
  #   @age
  # end

  # def name=(value)
  #   @name = value
  # end

  #  def age=(value)
  #   @age = value
  # end
end