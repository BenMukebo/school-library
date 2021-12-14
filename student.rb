require_relative('./person')

class Teacher < Person
  def initialize(*args, classroom, **kwargs)
    super(*args, **kwargs
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
