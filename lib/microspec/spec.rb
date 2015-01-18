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

    def block
      @_block
    end

    def initialize(description = nil, &block)
      @_description = description
      @_block = block
    end

    def perform
      context = Context.new

      instance_exec context, &block
    end
  end
end
