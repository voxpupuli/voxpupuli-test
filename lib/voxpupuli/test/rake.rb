require 'puppetlabs_spec_helper/rake_tasks'

PuppetLint.configuration.log_format = '%{path}:%{line}:%{check}:%{KIND}:%{message}'
# without this, puppet-lint always gives an exit code of 0
PuppetLint.configuration.fail_on_warnings = true

desc 'Run tests'
task test: [:release_checks]

task default: [:release_checks]

namespace :check do
  desc 'Check for trailing whitespace'
  task :trailing_whitespace do
    errors = []

    Dir.glob('**/*.md', File::FNM_DOTMATCH).sort.each do |filename|
      next if filename =~ %r{^((modules|acceptance|\.?vendor|spec/fixtures|pkg)/|REFERENCE.md)}
      File.foreach(filename).each_with_index do |line, index|
        if line =~ %r{\s\n$}
          errors << "#{filename} has trailing whitespace on line #{index + 1}"
        end
      end
    end

    unless errors.empty?
      errors.each { |error| puts error }
      exit 1
    end
  end
end

Rake::Task[:check].enhance ['check:trailing_whitespace']
