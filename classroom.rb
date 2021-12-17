class Classroom
  attr_accessor :label
  attr_reader :students

  # attr_accessor :label, :students

  def initialize(label)
    @label = label
    @students = []
  end

  def add_student(student)
    @students.push(student)
    student.classroom = self
  end

  # def add_student(student)
  #   @students.push(student) unless @students.include?(student)
  #   student.classroom = self
  # end
end
