# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'voxpupuli-test'
  s.version     = '9.2.1'
  s.authors     = ['Vox Pupuli']
  s.email       = ['pmc@voxpupuli.org']
  s.homepage    = 'http://github.com/voxpupuli/voxpupuli-test'
  s.summary     = 'Helpers for testing Vox Pupuli modules'
  s.description = 'A package that depends on all the gems Vox Pupuli modules need and methods to simplify spec helpers'
  s.licenses    = 'Apache-2.0'

  s.files       = Dir['lib/**/*.rb', 'rubocop.yml', 'LICENSE', 'README.md']

  s.required_ruby_version = '>= 2.7.0'

  s.add_runtime_dependency 'rake', '~> 13.0', '>= 13.0.6'

  # Testing
  s.add_runtime_dependency 'facterdb', '~> 3.1'
  s.add_runtime_dependency 'metadata-json-lint', '~> 4.0'
  s.add_runtime_dependency 'parallel_tests', '~> 4.2'
  s.add_runtime_dependency 'puppetlabs_spec_helper', '~> 8.0'
  # lazy dependency of the `validate` task. Will check the REFERENCE.md
  # 3.0.0 and later require Ruby 2.7
  s.add_runtime_dependency 'puppet-strings', '~> 4.0'
  s.add_runtime_dependency 'rspec-puppet', '~> 5.0'
  s.add_runtime_dependency 'rspec-puppet-facts', '~> 5.0'
  s.add_runtime_dependency 'rspec-puppet-utils', '~> 3.4'
  # puppet gem depends on syslog, but doesn't list it as explicit dependency
  # until Ruby 3.4, syslog was part of MRI ruby core
  # Add it here as workaround until we've an openvox gem to depend on
  s.add_runtime_dependency 'syslog', '~> 0.3.0'

  # Rubocop
  # newest versions that still support Ruby 2.6
  # jruby 9.3 in Puppetserver 7 is compatible with C Ruby 2.6
  s.add_runtime_dependency 'rubocop', '~> 1.50.0'
  s.add_runtime_dependency 'rubocop-rake', '~> 0.6.0'
  s.add_runtime_dependency 'rubocop-rspec', '~> 2.20.0'

  # Linting
  # meta gem to pull in all puppet-lint plugins + puppet-lint itself
  s.add_runtime_dependency 'voxpupuli-puppet-lint-plugins', '~> 5.0'

  # development
  s.add_development_dependency 'rspec', '~> 3.12'
end
