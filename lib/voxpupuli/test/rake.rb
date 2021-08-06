require 'puppetlabs_spec_helper/rake_tasks'
require 'metadata_json_deps'

PuppetLint.configuration.log_format = '%{path}:%{line}:%{check}:%{KIND}:%{message}'

desc 'Run tests'
task test: [:release_checks]

task default: [:release_checks]

namespace :check do
  desc 'Check for trailing whitespace'
  task :trailing_whitespace do
    Dir.glob('**/*.md', File::FNM_DOTMATCH).sort.each do |filename|
      next if filename =~ %r{^((modules|acceptance|\.?vendor|spec/fixtures|pkg)/|REFERENCE.md)}
      File.foreach(filename).each_with_index do |line, index|
        if line =~ %r{\s\n$}
          puts "#{filename} has trailing whitespace on line #{index + 1}"
          exit 1
        end
      end
    end
  end
end
Rake::Task[:release_checks].enhance ['check:trailing_whitespace']


desc 'Run metadata-json-deps'
task :metadata_deps do
  files = FileList['metadata.json']
  MetadataJsonDeps::run(files)
end
