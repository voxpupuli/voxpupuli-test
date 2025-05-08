# frozen_string_literal: true

namespace :check do
  desc 'Fails if .pp files present in tests folder'
  task :test_file do
    ppfiles = Dir[File.join('tests', '**', '*.pp')]
    unless ppfiles.empty?
      puts ppfiles
      raise '.pp files present in tests folder; Move them to an examples folder following the new convention'
    end
  end

  desc 'Fails if any ._ files are present in directory'
  task :dot_underscore do
    dirs = Dir['._*']
    unless dirs.empty?
      puts dirs
      raise '._ files are present in the directory'
    end
  end

  desc 'Fails if directories contain the files specified in .gitignore'
  task :git_ignore do
    matched = `git ls-files --ignored --exclude-standard --cached`
    raise 'git ls-files failed' unless $CHILD_STATUS.success?

    unless matched == ''
      puts matched
      raise 'File specified in .gitignore has been committed'
    end
  end

  desc 'Check for trailing whitespace'
  task :trailing_whitespace do
    errors = []

    Dir.glob('**/*.md', File::FNM_DOTMATCH).sort.each do |filename|
      next if filename =~ %r{^((modules|acceptance|\.?vendor|spec/fixtures|pkg)/|REFERENCE.md)}

      File.foreach(filename).each_with_index do |line, index|
        if line =~ /\s\n$/
          errors << "#{filename} has trailing whitespace on line #{index + 1}"
        end
      end
    end

    if errors.any?
      errors.each { |error| puts error }
      exit 1
    end
  end
end

desc 'Run static pre release checks'
task check: ['check:test_file', 'check:dot_underscore', 'check:git_ignore', 'check:trailing_whitespace']
