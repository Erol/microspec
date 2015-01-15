require 'microspec/predicates'

module Microspec
  module Expectation
    def self.type(boolean)
      boolean ? 'assert' : 'refute'
    end

    def self.evaluate(boolean, actual, method, expected, type: type(boolean), &block)
      if boolean ^ actual.send(method, *expected)
        raise Flunked.new "failed #{type}", actual: actual, method: method, expected: expected
      end

    rescue NoMethodError => exception
      if predicate = Predicates[method]
        if boolean ^ predicate.call(actual, *expected, &block)
          raise Flunked.new "failed #{type}", actual: actual, method: method, expected: expected
        end
      else
        raise exception
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
