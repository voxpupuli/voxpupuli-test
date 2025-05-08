# frozen_string_literal: true

# load and configure puppet-lint
require_relative 'rake/puppetlint'

# load and configure puppet-syntax
require_relative 'rake/puppetsyntax'

# define various helper tasks
require_relative 'rake/check'

# define the various spec tasks
require_relative 'rake/spec'

# static code analysis
require_relative 'rake/validate'
require_relative 'rake/rubocop'

desc 'Runs all necessary checks on a module'
task test: %i[lint validate parallel_spec check]

task default: [:test]
