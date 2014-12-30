module Microspec
  class Scope
    def description
      @_description
    end

    def block
      @_block
    end

    def initialize(description = nil, &block)
      @_description = description
      @_block = block
    end
  end
end
