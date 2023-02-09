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
puppetversion = ENV['PUPPET_VERSION'] || '>= 6.29'
gem 'puppet', puppetversion, :require => false
