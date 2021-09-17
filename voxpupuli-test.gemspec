# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'voxpupuli-test'
  s.version     = '2.6.0'
  s.authors     = ['Vox Pupuli']
  s.email       = ['pmc@voxpupuli.org']
  s.homepage    = 'http://github.com/voxpupuli/voxpupuli-test'
  s.summary     = 'Helpers for testing Vox Pupuli modules'
  s.description = 'A package that depends on all the gems Vox Pupuli modules need and methods to simplify spec helpers'
  s.licenses    = 'Apache-2.0'

  s.files       = Dir['lib/**/*.rb', 'rubocop.yml']

  s.add_runtime_dependency 'rake'

  # Testing
  s.add_runtime_dependency 'facterdb', '>= 1.4.0'
  s.add_runtime_dependency 'metadata-json-lint', '>= 3.0.1'
  s.add_runtime_dependency 'parallel_tests'
  s.add_runtime_dependency 'puppetlabs_spec_helper', '>= 2.16.0'
  s.add_runtime_dependency 'rspec-puppet-facts', '>= 2.0.1', '< 3'
  s.add_runtime_dependency 'rspec-puppet-utils', '>= 1.9.5'

  # Rubocop
  s.add_runtime_dependency 'rubocop', '~> 0.49.1'
  s.add_runtime_dependency 'rubocop-rspec', '~> 1.16.0'

  # Linting
  # meta gem to pull in all puppet-lint plugins + puppet-lint itself
  s.add_runtime_dependency 'voxpupuli-puppet-lint-plugins', '~> 2.0'

  # development
  s.add_development_dependency 'rspec'
end
