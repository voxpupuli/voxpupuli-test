source 'https://rubygems.org'

gem 'rspec-puppet-facts', git: 'https://github.com/bastelfreak/rspec-puppet-facts', branch: 'foobaz'

gemspec

group :release do
  gem 'faraday-retry', '~> 2.1', require: false
  gem 'github_changelog_generator', '~> 1.16.4', require: false
end

group :coverage, optional: ENV['COVERAGE']!='yes' do
  gem 'simplecov-console', :require => false
  gem 'codecov', :require => false
end

# Override gemspec for CI matrix builds.
gem 'puppet', ENV.fetch('PUPPET_VERSION', '>= 7.24'), :require => false
