require 'microspec'

spec do
  raises Microspec::Flunked, 'failed assert' do
    asserts([1, 2, 3]).include? 4
  end
end
