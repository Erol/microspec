require 'microspec/spec'

module Microspec
  class Scope
    def description
      @_description
    end

    def parent
      @_parent
    end

    def befores
      @_befores ||= []
    end

    def afters
      @_befores ||= []
    end

    def block
      @_block
    end

    def before(&block)
      befores << block
    end

    def after(&block)
      afters << block
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

    def start(context)
      parent.start context if parent

      befores.each do |before|
        before.call context
      end
    end

    def finish(context)
      parent.finish context if parent

      afters.each do |after|
        after.call context
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
  end
end
