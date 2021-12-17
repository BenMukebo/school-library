require_relative('./person')

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(name, age, parent_permission)
    @classroom = classroom
    # self.classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
    # @classroom.students.push(self) unless @classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

end
