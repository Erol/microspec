require 'microspec/raise'
require 'microspec/expectation'

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
      instance_eval &block
    end
  end
end
