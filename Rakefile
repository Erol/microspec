require 'bundler/gem_tasks'

$VERBOSE = true

desc 'Run gem specs'
task :spec do
  require 'microspec'

  runner = Microspec::Runner.new
  runner.includes << 'spec/**/*.rb'
  runner.excludes << 'spec/examples/**/*.rb'

  success = runner.perform

  exit 1 unless success
end

task :default => :spec
