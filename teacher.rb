require 'json'
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

  def convert_to_json
    {
      'class_name' => self.class.name,
      'name' => @name,
      'age' => @age,
      'specialization' => @specialization
    }.to_json
  end
end
