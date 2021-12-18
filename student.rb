# require_relative('./person')

# class Student < Person
#   # attr_reader :classroom

#   def initialize( age, name: 'Unknown', parent_permission: true, classroom: 'Unknown')
#     super(name, age, parent_permission)
#     @classroom = classroom
#   end

#   def play_hooky
#     '¯\(ツ)/¯'
#   end

#   def classroom=(classroom)
#     @classroom = classroom
#     classroom.students.push(self) unless classroom.students.include?(self)
#   end
# end
require_relative('./person')

class Student < Person
  attr_reader :classroom

  def initialize(*args, classroom: 'Unknown', **kwargs)
    super(*args, **kwargs)
    @classroom = classroom
  end

  def classroom=(classroom)
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
