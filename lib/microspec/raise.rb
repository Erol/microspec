require 'microspec/flunked'

module Microspec
  module Raise
    module Helper
      def self.exception(expected: nil, actual: nil, message: nil)
        if actual.nil?
          Flunked.new 'missing exception', expected: expected, actual: actual
        elsif not actual.is_a? expected.class
          Flunked.new 'unexpected exception', expected: expected, actual: actual
        elsif message.is_a? String and not actual.message == message
          Flunked.new 'unexpected exception message', expected: expected, actual: actual
        elsif message.is_a? Regexp and not actual.message =~ message
          Flunked.new 'unexpected exception message', expected: expected, actual: actual
        end
      end
    end

    module Method
      def raises(expected = Exception, message = nil)
        expected = expected.new message if expected.is_a? Class

        yield

      rescue Exception => actual
      ensure
        exception = Helper.exception expected: expected, actual: actual, message: message

        raise exception if exception
      end
    end
  end
end
