module Microspec
  class Runner
    def requires
      @_requires ||= []
    end

    def includes
      @_includes ||= []
    end
  end
end
