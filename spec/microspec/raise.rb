require 'microspec'

class SomeException < Exception; end

spec do
  raises Microspec::Flunked, 'missing exception' do
    raises SomeException do
    end
  end
end
