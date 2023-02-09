source 'https://rubygems.org'

gemspec

group :release do
  gem 'github_changelog_generator', :require => false
end

group :coverage, optional: ENV['COVERAGE']!='yes' do
  gem 'simplecov-console', :require => false
  gem 'codecov', :require => false
end

# Override gemspec for CI matrix builds.
gem 'puppet', ENV.fetch('PUPPET_VERSION', '>= 6.29'), :require => false
