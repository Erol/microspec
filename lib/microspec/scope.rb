require 'microspec/spec'

module Microspec
  class Scope
    def description
      @_description
    end

    def block
      @_block
    end

    def spec(description = nil, &block)
      context = Context.new

      spec = Spec.new description, context: context, &block
      spec.perform
    end

    def initialize(description = nil, &block)
      @_description = description
      @_block = block
    end

    def perform
      instance_eval(&block)
    end
  end
end
