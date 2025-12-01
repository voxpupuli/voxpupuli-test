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

  desc 'Check that no misplaced files exist in module code/data'
  task :misplaced_files do
    misplaced = []
    misplaced += Dir['data/**/*'].reject { |fn| !File.file?(fn) || fn.end_with?('.yaml') || fn.end_with?('.yml') }
    misplaced += Dir['lib/**/*'].reject { |fn| !File.file?(fn) || fn.end_with?('.rb') }
    misplaced += Dir['{functions,manifests,types}/**/*'].reject { |fn| !File.file?(fn) || fn.end_with?('.pp') }
    misplaced += Dir['templates/**/*'].reject { |fn| !File.file?(fn) || fn.end_with?('.epp') || fn.end_with?('.erb') }

    if misplaced.any?
      misplaced.each { |filename| puts "#{filename} is misplaced" }
      exit 1
    end
  end

  desc 'Check that all module code and data are valid UTF-8 without BOM'
  task :utf8 do
    errors = []

    Dir['{data,functions,lib,manifests,templates,types}/**/*'].each do |filename|
      next unless File.file? filename

      File.open(filename, 'r:utf-8') do |file|
        data = file.readline

        if !data.valid_encoding?
          errors << "#{filename} can't be parsed as UTF-8"
        elsif data.bytes[0..2] == [0xef, 0xbb, 0xbf]
          errors << "#{filename} contains BOM"
        elsif data.include? "\x00" # UTF-16 without BOM is technically valid UTF-8, but contains null-bytes
          errors << "#{filename} contains null bytes"
        elsif !file.eof?
          redo
        end
      end
    rescue StandardError => e
      errors << "#{filename} failed to parse, #{e.class}: #{e}"
    end

    if errors.any?
      errors.each { |error| puts error }
      exit 1
    end
  end
end

desc 'Run static pre release checks'
task check: ['check:test_file', 'check:dot_underscore', 'check:git_ignore', 'check:trailing_whitespace']
