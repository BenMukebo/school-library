require_relative('./person')

class Teacher < Person
  def initialize(classroom)
    super(name, age, parent_permission)
    @classroom = classroom
  end
  
  def play_hooky
    "¯\(ツ)/¯"
  end
end