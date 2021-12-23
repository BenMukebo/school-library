require_relative '../corrector'

describe Corrector do
  context 'When testing the Correct class' do
    it 'should correct name' do
      correct = Corrector.new
      name = 'capitalization'
      expect(correct.correct_name(name)).to eq 'Capitaliza'
    end
  end
end
