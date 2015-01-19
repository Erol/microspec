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

    def scope
      @_scope
    end

    def block
      @_block
    end

    def initialize(description = nil, scope: nil, &block)
      @_description = description
      @_scope = scope
      @_block = block
    end

    def perform
      instance_exec scope.context, &block
    end
  end
end
