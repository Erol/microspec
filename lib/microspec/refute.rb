require 'microspec/predicates'

module Microspec
  module Refute
    module Method
      def refutes(object, &block)
        Object.new object, &block
      end
    end

    class Object
      def initialize(actual)
        @_actual = actual
      end

      def ==(expected)
        method_missing :==, expected
      end

      def method_missing(method, *expected, &block)
        if @_actual.send method, *expected
          raise Flunked.new 'failed assert', actual: @_actual, method: method, expected: expected
        end

      rescue Exception => exception
      ensure
        if exception.is_a? Flunked
          raise exception
        elsif Predicates[method]
          if Predicates[method].call @_actual, *expected, &block
            raise Flunked.new 'failed assert', actual: @_actual, method: method, expected: expected
          end
        elsif exception
          raise exception
        end
      end
    end
  end
end
