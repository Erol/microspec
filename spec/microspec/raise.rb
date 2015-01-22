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

spec do
  raises SomeException do
    raise SomeException
  end
end

spec do
  raises do
    raise SomeException
  end
end

spec do
  raises SomeException, 'failed' do
    raise SomeException, 'failed'
  end
end

spec do
  raises SomeException, /fail/ do
    raise SomeException, 'failed'
  end
end
