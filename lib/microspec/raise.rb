require 'microspec/flunked'

module Microspec
  module Raise
    module Method
      def raises(expected = Exception, message = nil)
        expected = expected.new message if expected.is_a? Class

        yield

      rescue Exception => actual
      ensure
        exception = if actual.nil?
                      Flunked.new 'missing exception', expected: expected, actual: actual
                    end

        raise exception if exception
      end
    end
  end
end
