require_relative('./person')

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, name = 'Unknown')
    super(name, age)
    @specialization = specialization
    @age = age
    @name = name
  end

  def can_use_services?
    true
  end

  def to_hash
    {name: @name, age: @age}
  end

end
