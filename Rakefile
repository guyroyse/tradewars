require 'rubygems'
require 'rspec/core'
require 'rspec/core/rake_task'
require 'cucumber'
require 'cucumber/rake/task'

RSpec::Core::RakeTask.new :spec

Cucumber::Rake::Task.new :features

task :default => [:spec, :features]
