require 'microspec/raise'
require 'microspec/assert'
require 'microspec/refute'

module Microspec
  class Spec
    include Raise::Method
    include Assert::Method
    include Refute::Method

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
