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
    end
  end
end
