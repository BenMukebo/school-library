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
  # def to_hash
  #   {name = @name, age = @age}
  # end
end
