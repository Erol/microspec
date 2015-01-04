require 'microspec'

spec do
  raises Microspec::Flunked, 'failed assert' do
    refutes([1, 2, 3]).include? 3
  end
end

spec do
  raises Microspec::Flunked, 'failed assert' do
    refutes(true).truthy?
  end
end

spec do
  raises Microspec::Flunked, 'failed assert' do
    refutes(false).falsey?
  end
end

spec do
  raises Microspec::Flunked, 'failed assert' do
    refutes(100) == 100
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