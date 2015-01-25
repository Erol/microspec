require 'microspec/scope'

module Microspec
  class Runner
    def requires
      @_requires ||= []
    end

    def includes
      @_includes ||= []
    end

    def excludes
      @_excludes ||= []
    end

    def filenames
      Dir[*includes] - Dir[*excludes] - requires
    end

    def perform
      requires.each do |filename|
        require File.join Dir.pwd, filename
      end

      filenames.each do |filename|
        context = Class.new Microspec::Context
        scope = Scope.new filename, context: context do
          instance_eval File.read(filename), filename
        end

        scope.perform
      end
    end
  end
end
