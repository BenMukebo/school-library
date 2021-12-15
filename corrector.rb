class Corrector 
  def correct_name(name)
   true if name.capitalize
  end
end

person = Corrector.new

puts person.correct_name('benkasmukebomagnus')