require_relative('./person')

class Teacher < Person
  def initialize(@specialization)
    super(name, age, parent_permission)
    @@specialization = @specialization
  end
  
  def play_hooky
    "¯\(ツ)/¯"
  end
end