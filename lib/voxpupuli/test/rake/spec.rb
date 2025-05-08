# frozen_string_literal: true

require 'puppet_fixtures/tasks'
require 'parallel_tests'
require 'rspec/core/rake_task'

pattern = 'spec/{aliases,classes,defines,functions,hosts,integration,plans,tasks,type_aliases,types,unit}/**/*_spec.rb'

desc 'Run spec tests and clean the fixtures directory if successful'
task spec: :'fixtures:prep' do |_t, args|
  Rake::Task['spec:standalone'].invoke(*args.extras)
  Rake::Task['fixtures:clean'].invoke
end

desc 'Run spec tests in parallel and clean the fixtures directory if successful'
task parallel_spec: :'fixtures:prep' do |_t, args|
  Rake::Task['parallel_spec:standalone'].invoke(*args.extras)
  Rake::Task['fixtures:clean'].invoke
end

desc 'Parallel spec tests'
task 'parallel_spec:standalone' do |_t, args|
  file_list = Rake::FileList[pattern].to_a
  if file_list.empty?
    warn 'No files for parallel_spec to run against'
  else
    ci_opts = ENV['CI_SPEC_OPTIONS'].to_s.strip.split
    args = ['--type', 'rspec', '--', '--format', 'progress'] + ci_opts + ['--'] + file_list

    ParallelTests::CLI.new.run(args)
  end
end

RSpec::Core::RakeTask.new('spec:standalone') do |t, _args|
  t.rspec_opts = []
  unless ENV['CI_SPEC_OPTIONS'].nil?
    t.rspec_opts << ENV['CI_SPEC_OPTIONS']
  end
  t.pattern = pattern
end
