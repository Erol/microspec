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
    end
  end
end
