require_relative '../student'

describe Student do
  context 'When testing the Student class' do
    before(:each) do
      @student = Student.new(18, 'Maej')
    end

    it 'student name should match' do
      expect(@student.name).to eq 'Maej'
    end

    it 'student is a Student class instance' do
      expect(@student).to be_an_instance_of Student
    end
  end
end
