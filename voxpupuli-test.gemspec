# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'voxpupuli-test'
  s.version     = '13.1.0'
  s.authors     = ['Vox Pupuli']
  s.email       = ['pmc@voxpupuli.org']
  s.homepage    = 'http://github.com/voxpupuli/voxpupuli-test'
  s.summary     = 'Helpers for testing Vox Pupuli modules'
  s.description = 'A package that depends on all the gems Vox Pupuli modules need and methods to simplify spec helpers'
  s.licenses    = 'Apache-2.0'

  s.files       = Dir['lib/**/*.rb', 'rubocop.yml', 'LICENSE', 'README.md']

  # This ruby version matches the agent version
  s.required_ruby_version = '>= 3.2.0'

  s.add_dependency 'rake', '~> 13.0', '>= 13.0.6'

  # Testing
  s.add_dependency 'facterdb', '>= 3.1', '< 5.0'
  s.add_dependency 'metadata-json-lint', '>= 4.0', '< 6'
  s.add_dependency 'openvox-strings', '>= 5.0', '< 7'
  s.add_dependency 'parallel_tests', '>= 4.2', '< 6'
  s.add_dependency 'puppet_fixtures', '>= 0.1', '< 3'
  s.add_dependency 'puppet-syntax', '>= 6.0', '< 8'
  s.add_dependency 'rspec-github', '>= 2.0', '< 4'
  s.add_dependency 'rspec-puppet', '~> 5.0'
  s.add_dependency 'rspec-puppet-facts', '>= 5.4', '< 7'
  # openvox gem depends on syslog, but doesn't list it as explicit dependency
  # until Ruby 3.4, syslog was part of MRI ruby core
  # https://github.com/OpenVoxProject/puppet/issues/90
  s.add_dependency 'syslog', '~> 0.3.0'

  # Rubocop
  # has to be compatible with MRI Ruby 3.1 due to OpenVox server using Jruby
  s.add_dependency 'rubocop', '~> 1.81.1'
  s.add_dependency 'rubocop-rake', '~> 0.7.1'
  s.add_dependency 'rubocop-rspec', '~> 3.7.0'

  # Linting
  # meta gem to pull in all puppet-lint plugins + puppet-lint itself
  s.add_dependency 'voxpupuli-puppet-lint-plugins', '>= 6.0', '< 8'

  # development
  s.add_development_dependency 'rspec', '~> 3.12'
end
