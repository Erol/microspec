require 'microspec'

spec do
  raises Microspec::Flunked, 'failed assert' do
    refutes([1, 2, 3]).include? 3
  end
end
