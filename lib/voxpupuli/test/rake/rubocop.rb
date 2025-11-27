# frozen_string_literal: true

require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |task|
  # These make the rubocop experience maybe slightly less terrible
  task.options = ['--debug', '--display-style-guide', '--extra-details']

  # Use Rubocop's Github Actions formatter if possible
  if ENV['GITHUB_ACTIONS'] == 'true'
    task.formatters << 'github'
  end

  if ENV['CODECLIMATE_REPORT_FILE']
    # Ensure the default rubocop formatter still runs even when producing codeclimate report
    require 'rubocop'
    task.formatters << (RuboCop::ConfigStore.new.for_pwd.for_all_cops['DefaultFormatter'] || 'progress') if task.formatters.empty?

    task.requires << File.join(__dir__, '../rubocop_formatters/codeclimate.rb')
    task.options += ['--format', 'CodeclimateFormatter', '--out', ENV['CODECLIMATE_REPORT_FILE']]
  end
end
