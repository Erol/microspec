require 'microspec/predicates'

module Microspec
  module Expectation
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
        type = @_boolean ? 'assert' : 'refute'

        unless !!@_boolean == !!@_actual.send(method, *expected)
          raise Flunked.new "failed #{type}", actual: @_actual, method: method, expected: expected
        end

      rescue Exception => exception
      ensure
        if exception.is_a? Flunked
          raise exception
        elsif Predicates[method]
          unless !!@_boolean == !!Predicates[method].call(@_actual, *expected, &block)
            raise Flunked.new "failed #{type}", actual: @_actual, method: method, expected: expected
          end
        elsif exception
          raise exception
        end
      end
    end
  end
end
