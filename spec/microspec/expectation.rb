require 'microspec'

spec do
  raises Microspec::Flunked, 'failed assert' do
    asserts([1, 2, 3]).include? 4
  end
end

spec do
  raises Microspec::Flunked, 'failed assert' do
    asserts(true).falsey?
  end
end

spec do
  raises Microspec::Flunked, 'failed assert' do
    asserts(false).truthy?
  end
end

spec do
  raises Microspec::Flunked, 'failed assert' do
    asserts(100) == 1000
  end
end

spec do
  raises Microspec::Flunked, 'failed assert' do
    asserts(100) > 1000
  end
end

spec do
  raises Microspec::Flunked, 'failed assert' do
    asserts(100) < 10
  end
end

spec do
  raises NoMethodError, /unknown/  do
    asserts(100).unknown?
  end
end

spec do
  asserts([1, 2, 3]).include? 3
end

spec do
  asserts(true).truthy?
end

spec do
  asserts(false).falsey?
end

spec do
  asserts(100) == 100
end

spec do
  asserts(100) < 1000
end

spec do
  asserts(100) > 10
end



spec do
  raises Microspec::Flunked, 'failed refute' do
    refutes([1, 2, 3]).include? 3
  end
end

spec do
  raises Microspec::Flunked, 'failed refute' do
    refutes(true).truthy?
  end
end

spec do
  raises Microspec::Flunked, 'failed refute' do
    refutes(false).falsey?
  end
end

spec do
  raises Microspec::Flunked, 'failed refute' do
    refutes(100) == 100
  end
end

spec do
  raises NoMethodError, /unknown/  do
    refutes(100).unknown?
  end
end

spec do
  refutes([1, 2, 3]).include? 4
end

spec do
  refutes(true).falsey?
end

spec do
  refutes(false).truthy?
end

spec do
  refutes(100) == 1000
end
