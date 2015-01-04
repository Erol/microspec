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
  asserts([1, 2, 3]).include? 3
end
