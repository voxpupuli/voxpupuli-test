# frozen_string_literal: true

require 'metadata-json-lint/rake_task'
require 'openvox-strings/tasks'

namespace :validate do
  desc 'Validate all .rb files'
  task :ruby do
    Dir['lib/**/*.rb', 'tasks/**/*.rb'].each do |lib_file|
      RubyVM::InstructionSequence.compile_file(lib_file)
      puts "#{lib_file} syntax OK"
      true
    rescue SyntaxError => e
      puts e.message
    end
  end

  desc 'validate REFERENCE.md if it exists'
  task :strings do
    if File.exist?('REFERENCE.md')
      Rake::Task['strings:validate:reference'].invoke
    end
  end
end

# `syntax` will validate pp, hiera, erb, epp files
desc 'Check syntax of Ruby files and call :syntax and :metadata_lint'
task validate: ['validate:ruby', 'syntax', 'metadata_lint', 'validate:strings']
