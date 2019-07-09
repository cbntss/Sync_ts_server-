require 'rubygems'
require 'puppetlabs_spec_helper/rake_tasks'
require 'rspec/core/rake_task'

task :default do
  RSpec::Core::RakeTask.new(:spec)
  Rake::Task["spec"].execute
end
