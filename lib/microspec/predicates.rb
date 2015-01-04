module Microspec
  module Predicates
    @_predicates = {}

    def self.[](method)
      @_predicates[method]
    end

    def self.[]=(method, proc)
      @_predicates[method] = proc
    end
  end

  Predicates[:truthy?] = -> (actual) { actual }
  Predicates[:falsey?] = -> (actual) { !actual }
end
