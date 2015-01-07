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
      spec = Spec.new description, &block
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
