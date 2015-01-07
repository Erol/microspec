require 'microspec/predicates'

module Microspec
  module Expectation
    def self.evaluate(boolean, actual, method, expected, &block)
      type = boolean ? 'assert' : 'refute'

      unless boolean == !!actual.send(method, *expected)
        raise Flunked.new "failed #{type}", actual: actual, method: method, expected: expected
      end

    rescue NoMethodError
      unless boolean == !!Predicates[method].call(actual, *expected, &block)
        raise Flunked.new "failed #{type}", actual: actual, method: method, expected: expected
      end

    end

    module Methods
      def asserts(object)
        Object.new true, object
      end

      def refutes(object)
        Object.new false, object
      end
    end

    class Object
      def initialize(boolean, actual)
        @_boolean = boolean
        @_actual = actual
      end

      def ==(expected)
        method_missing :==, expected
      end

      def method_missing(method, *expected, &block)
        Expectation.evaluate @_boolean, @_actual, method, expected
      end
    end
  end
end
