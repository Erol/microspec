require 'microspec/raise'
require 'microspec/expectation'
require 'microspec/context'

module Microspec
  class Spec
    def description
      @_description
    end

    def context
      @_context
    end

    def block
      @_block
    end

    def initialize(description = nil, context: Microspec::Context, &block)
      @_description = description
      @_context = context
      @_block = block
    end

    def perform
      context.new.instance_eval(&block)
    end
  end
end
