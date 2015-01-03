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

spec do
  raises Microspec::Flunked, 'unexpected exception message' do
    raises SomeException, 'failed' do
      raise SomeException, 'flunked'
    end
  end
end

spec do
  raises Microspec::Flunked, 'unexpected exception message' do
    raises SomeException, /fail/ do
      raise SomeException, 'flunked'
    end
  end
end
