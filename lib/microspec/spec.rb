require 'microspec/raise'
require 'microspec/assert'

module Microspec
  class Spec
    include Raise::Method
    include Assert::Method

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

    def perform
      instance_eval &block
    end
  end
end
