# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :release do
  gem 'faraday-retry', '~> 2.1', require: false
  gem 'github_changelog_generator', '~> 1.16.4', require: false
end

# Override gemspec for CI matrix builds.
gem 'puppet', ENV.fetch('PUPPET_VERSION', '>= 7.24'), require: false
