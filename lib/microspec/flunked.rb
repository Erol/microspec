module Microspec
  class Flunked < StandardError
    def metadata
      @_metadata ||= {}
    end

    def initialize(message = nil, **metadata)
      super message

      metadata.each do |key, value|
        self.metadata[key] = value
      end
    end
  end
end
