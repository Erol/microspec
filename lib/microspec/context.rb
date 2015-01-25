module Microspec
  class Context
    include Raise::Method
    include Expectation::Methods

    def __memoizations
      @___memoizations ||= {}
    end
  end
end
