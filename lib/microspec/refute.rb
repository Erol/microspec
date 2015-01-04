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

      def method_missing(method, *expected, &block)
        if @_actual.send method, *expected
          raise Flunked.new 'failed assert', actual: @_actual, method: method, expected: expected
        end
      end
    end
  end
end
