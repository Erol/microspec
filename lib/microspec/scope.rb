require 'microspec/spec'

module Microspec
  class Scope
    def description
      @_description
    end

    def parent
      @_parent
    end

    def block
      @_block
    end

    def setup(&block)
      setups << block
    end

    def teardown(&block)
      teardowns << block
    end

    def scope(description = nil, &block)
      scope = Scope.new description, parent: self, &block
      scope.perform
    end

    def spec(description = nil, &block)
      Context.new.tap do |context|
        start context

        spec = Spec.new description, context: context, &block
        spec.perform

        finish context
      end
    end

    def initialize(description = nil, parent: nil, &block)
      @_description = description
      @_parent = parent
      @_block = block
    end

    def perform
      instance_eval(&block)
    end

    protected

    def setups
      @_setups ||= []
    end

    def teardowns
      @_setups ||= []
    end

    def start(context)
      parent.start context if parent

      setups.each do |setup|
        setup.call context
      end
    end

    def finish(context)
      parent.finish context if parent

      teardowns.each do |teardown|
        teardown.call context
      end
    end
  end
end
