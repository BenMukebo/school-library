require_relative('./person')

class Student < Person
  attr_reader :classroom

  def initialize(*args, classroom: 'Unknown', **kwargs)
    super(*args, **kwargs)
    @classroom = classroom
    # @age = age
    # @name = name
  end

  def classroom=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def convert_to_json
    {
      'class_name' => self.class.name,
      'name' => @name,
      'age' => @age
    }.to_json
  end
end
