require 'microspec/raise'
require 'microspec/expectation'
require 'microspec/context'

module Microspec
  class Spec
    def description
      @_description
    end

    def instance
      @_instance
    end

    def block
      @_block
    end

    def initialize(description = nil, instance:, &block)
      @_description = description
      @_instance = instance
      @_block = block
    end

    def perform
      instance.instance_eval(&block)
    end
  end
end
