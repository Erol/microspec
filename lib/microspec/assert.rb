module Microspec
  module Assert
    module Method
      def asserts(object, &block)
        Object.new object, &block
      end
    end

    class Object
      def initialize(actual)
        @_actual = actual
      end

      def method_missing(method, *expected, &block)
        unless @_actual.send method, *expected
          raise Flunked.new 'failed assert', actual: @_actual, method: method, expected: expected
        end
      end
    end
  end
end
