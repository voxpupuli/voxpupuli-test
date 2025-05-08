# frozen_string_literal: true

require 'puppet-lint/tasks/puppet-lint'
# Must clear as it will not override the existing puppet-lint rake task since we require to import for
# the PuppetLint::RakeTask
Rake::Task[:lint].clear
# without this, puppet-lint always gives an exit code of 0
PuppetLint.configuration.fail_on_warnings = true
# Utilize PuppetLint global configuration so that these settings can be tweaked by
# spec_helper.rb in an individual module
PuppetLint.configuration.relative = true
PuppetLint.configuration.ignore_paths << '.vendor/**/*.pp'
PuppetLint.configuration.ignore_paths << 'bundle/**/*.pp'
PuppetLint.configuration.ignore_paths << 'pkg/**/*.pp'
PuppetLint.configuration.ignore_paths << 'spec/**/*.pp'
PuppetLint.configuration.ignore_paths << 'tests/**/*.pp'
PuppetLint.configuration.disable_140chars
PuppetLint.configuration.disable_documentation
PuppetLint.configuration.disable_single_quote_string_with_variables
PuppetLint::RakeTask.new(:lint)

desc 'Run puppet-lint and fix issues automatically'
PuppetLint::RakeTask.new(:lint_fix) do |config|
  config.fix = true
end

PuppetLint.configuration.log_format = '%<path>s:%<line>s:%<check>s:%<KIND>s:%<message>s'
