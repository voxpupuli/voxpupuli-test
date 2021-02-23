# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = 'voxpupuli-test'
  s.version     = '2.2.0'
  s.authors     = ['Vox Pupuli']
  s.email       = ['pmc@voxpupuli.org']
  s.homepage    = 'http://github.com/voxpupuli/voxpupuli-test'
  s.summary     = 'Helpers for testing Vox Pupuli modules'
  s.description = 'A package that depends on all the gems Vox Pupuli modules need and methods to simplify spec helpers'
  s.licenses    = 'Apache-2.0'

  s.files       = Dir['lib/**/*.rb', 'rubocop.yml']

  s.required_ruby_version = '>= 2.4.0'

  s.add_runtime_dependency 'rake'

  # Testing
  s.add_runtime_dependency 'facterdb', '>= 1.4.0'
  s.add_runtime_dependency 'metadata-json-lint'
  s.add_runtime_dependency 'parallel_tests'
  s.add_runtime_dependency 'puppetlabs_spec_helper', '>= 3.0.0'
  s.add_runtime_dependency 'rspec-puppet-facts', '>= 1.9.5'
  s.add_runtime_dependency 'rspec-puppet-utils', '>= 1.9.5'

  # Rubocop
  s.add_runtime_dependency 'rubocop', '~> 0.49.1'
  s.add_runtime_dependency 'rubocop-rspec', '~> 1.16.0'

  # Linting
  s.add_runtime_dependency 'puppet-lint-absolute_classname-check', '>= 2.0.0'
  s.add_runtime_dependency 'puppet-lint-anchor-check'
  s.add_runtime_dependency 'puppet-lint-classes_and_types_beginning_with_digits-check'
  s.add_runtime_dependency 'puppet-lint-leading_zero-check'
  s.add_runtime_dependency 'puppet-lint-legacy_facts-check'
  s.add_runtime_dependency 'puppet-lint-topscope-variable-check'
  s.add_runtime_dependency 'puppet-lint-trailing_comma-check'
  s.add_runtime_dependency 'puppet-lint-unquoted_string-check'
  s.add_runtime_dependency 'puppet-lint-variable_contains_upcase'
  s.add_runtime_dependency 'puppet-lint-version_comparison-check'
  s.add_runtime_dependency 'puppet-lint-resource_reference_syntax'
  s.add_runtime_dependency 'puppet-lint-manifest_whitespace-check'
  s.add_runtime_dependency 'puppet-lint-file_ensure-check'
  s.add_runtime_dependency 'puppet-lint-strict_indent-check'

  # development
  s.add_development_dependency 'rspec'
end
