# frozen_string_literal: true

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

begin
  require 'github_changelog_generator/task'

  GitHubChangelogGenerator::RakeTask.new :changelog do |config|
    config.header = "# Changelog\n\nAll notable changes to this project will be documented in this file."
    config.exclude_labels = %w[duplicate question invalid wontfix wont-fix skip-changelog github_actions]
    config.user = 'voxpupuli'
    config.project = 'voxpupuli-test'
    config.future_release = "v#{Gem::Specification.load("#{config.project}.gemspec").version}"
  end
rescue LoadError
  # Optional gem, release group is probably disabled
end

# this is identical to our config in voxpupuli-rubocop, but that gem targets Ruby 2.7
# and voxupuli-test depends on an older rubocop version because we provide it for our modules
require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |task|
  # These make the rubocop experience maybe slightly less terrible
  task.options = ['--display-cop-names', '--display-style-guide', '--extra-details']
  # Use Rubocop's Github Actions formatter if possible
  task.formatters << 'github' if ENV['GITHUB_ACTIONS'] == 'true'
end
