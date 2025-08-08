# frozen_string_literal: true

source 'https://rubygems.org'

gemspec

group :release, optional: true do
  gem 'faraday-retry', '~> 2.1', require: false
  gem 'github_changelog_generator', '~> 1.16.4', require: false
end

# Override gemspec for CI matrix builds.
gem 'openvox', ENV.fetch('OPENVOX_VERSION', '>= 8.0'), require: false
