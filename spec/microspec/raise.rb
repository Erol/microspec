require 'microspec'

class SomeException < Exception; end
class SomeOtherException < Exception; end

spec do
  raises Microspec::Flunked, 'missing exception' do
    raises SomeException do
    end
  end
end

spec do
  raises Microspec::Flunked, 'unexpected exception' do
    raises SomeException do
      raise SomeOtherException
    end
  end
end
