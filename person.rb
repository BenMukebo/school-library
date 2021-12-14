class Person
  def initialize(name = 'Unknown', age, parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def can_use_services?
    if is_of_age? || @parent_permission == true 
      true
    end
  end

  private

  def is_of_age?
    if @age >= 18 
      true
    elsif
      false
    end
  end
end