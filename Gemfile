source ENV['GEM_SOURCE'] || "https://rubygems.org"

def location_for(place, fake_version = nil)
  if place =~ /^(git[:@][^#]*)#(.*)/
    [fake_version, { :git => $1, :branch => $2, :require => false }].compact
  elsif place =~ /^file:\/\/(.*)/
    ['>= 0', { :path => File.expand_path($1), :require => false }]
  else
    [place, { :require => false }]
  end
end

group :test do
  gem 'puppetlabs_spec_helper', '>= 2.14.0',                        :require => false
  gem 'rspec-puppet-facts', '>= 1.8.0',                             :require => false
  gem 'rspec-puppet-utils',                                         :require => false
  gem 'puppet-lint-leading_zero-check',                             :require => false
  gem 'puppet-lint-trailing_comma-check',                           :require => false
  gem 'puppet-lint-version_comparison-check',                       :require => false
  gem 'puppet-lint-classes_and_types_beginning_with_digits-check',  :require => false
  gem 'puppet-lint-unquoted_string-check',                          :require => false
  gem 'puppet-lint-variable_contains_upcase',                       :require => false
  gem 'puppet-lint-absolute_classname-check',                       :require => false
  gem 'metadata-json-lint',                                         :require => false
  gem 'redcarpet',                                                  :require => false
  gem 'rubocop', '~> 0.49.1',                                       :require => false
  gem 'rubocop-rspec', '~> 1.15.0',                                 :require => false
  gem 'mocha', '~> 1.4.0',                                          :require => false
  gem 'coveralls',                                                  :require => false
  gem 'simplecov-console',                                          :require => false
  gem 'parallel_tests',                                             :require => false
end

group :development do
  gem 'travis',                   :require => false
  gem 'travis-lint',              :require => false
  gem 'guard-rake',               :require => false
  gem 'overcommit', '>= 0.39.1',  :require => false
end

group :system_tests do
  gem 'winrm',                              :require => false
  if beaker_version = ENV['BEAKER_VERSION']
    gem 'beaker', *location_for(beaker_version)
  else
