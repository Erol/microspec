require 'microspec/spec'

module Microspec
  class Scope
    def description
      @_description
    end

    def parent
      @_parent
    end

    def context
      @_context
    end

    def block
      @_block
    end

    def definitions
      @_definitions ||= {}
    end

    def define(definitions)
      definitions.each do |key, value|
        context.send :define_method, key do
          __memoizations.fetch key do
            __memoizations[key] = if value.is_a? Proc
                                    instance_exec(&value)
                                  else
                                    value
                                  end
          end
        end
      end
    end

    def setup(&block)
      setups << block
    end

    def teardown(&block)
      teardowns << block
    end

    def scope(description = nil, &block)
      scope = Scope.new description, parent: self, context: Class.new(context), &block
      scope.perform
    end

    def spec(description = nil, &block)
      instance = context.new

      start instance

      spec = Spec.new description, instance: instance, &block
      spec.perform

      finish instance
    end

    def initialize(description = nil, parent: nil, context: nil, &block)
      @_description = description
      @_parent = parent
      @_context = context
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

    def start(instance)
      parent.start instance if parent

      setups.each do |setup|
        instance.instance_exec(&setup)
      end
    end

    def finish(instance)
      parent.finish instance if parent

      teardowns.each do |teardown|
        instance.instance_exec(&teardown)
      end
    end
  end
end
