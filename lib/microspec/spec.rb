require 'microspec/raise'
require 'microspec/expectation'
require 'microspec/context'

module Microspec
  class Spec
    include Raise::Method
    include Expectation::Methods

    def description
      @_description
    end

    def context
      @_context
    end

    def block
      @_block
    end

    def initialize(description = nil, context: nil, &block)
      @_description = description
      @_context = context
      @_block = block
    end

    def perform
      instance_exec context, &block
    end
  end
end
