# frozen_string_literal: true

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |task|
  # These make the rubocop experience maybe slightly less terrible
  task.options = ['-D', '-S', '-E']

  # Use Rubocop's Github Actions formatter if possible
  if ENV['GITHUB_ACTIONS'] == 'true'
    task.formatters << 'github'
  end
end
