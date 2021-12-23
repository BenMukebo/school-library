require_relative '../classroom'
require_relative '../student'

describe Classroom do
  context 'When testing the Classroom class' do
    before(:each) do
      @classroom = Classroom.new('room_1')
      @student = Student.new(14, @classroom, 'ben')
    end

    it 'classroom label should match' do
      expect(@classroom.label).to eq 'room_1'
    end

    it 'Add student ' do
      @classroom.add_student(@student)
      expect(@classroom.students.size).to be 1
    end
  end
end
