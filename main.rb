class Person
  def initialize(name = "Unknown", age, parent_permission = true)
    @name = name
    @age = age
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def name=(value)
    @name = value
  end

   def age=(value)
    @age = value
  end
end