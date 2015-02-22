require 'microspec/raise'
require 'microspec/expectation'
require 'microspec/context'

module Microspec
  class Spec
    def description
      @_description
    end

    def scope
      @_scope
    end

    def constants
      @_constants ||= []
    end

    def namespace
      @_namespace ||= block.binding.eval "Module.nesting.first"
    end

    def context
      @_context
    end

    def block
      @_block
    end

    def initialize(description = nil, scope:, &block)
      @_description = description
      @_scope = scope
      @_context = scope.context.new
      @_block = block
    end

    def perform
      sweep do
        scope.start context

        context.instance_eval(&block)

        scope.finish context
      end
    end

    def sweep
      constants.push(*namespace.constants)

      yield

      constants = namespace.constants - self.constants

      constants.each do |constant|
        namespace.send :remove_const, constant
      end
    end
  end
end
