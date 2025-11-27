# frozen_string_literal: true

require 'digest'

# Simple codeclimate-style JSON formatter for RuboCop
class CodeclimateFormatter < RuboCop::Formatter::BaseFormatter
  include RuboCop::PathUtil

  SEVERITY_MAP = {
    info: 'info',
    refactor: 'minor',
    convention: 'minor',
    warning: 'major',
    error: 'critical',
    fatal: 'blocker',
  }.freeze

  attr_reader :output_array

  def initialize(output, options = {})
    super
    @output_array = []
  end

  def file_finished(file, offenses)
    @output_array += hashes_for_file(file, offenses)
  end

  def finished(_inspected_files)
    output.write output_array.to_json
  end

  private

  def hashes_for_file(file, offenses)
    offenses.map do |offense|
      category, name = offense.cop_name.split('/')
      name, category = category, name if name.nil?

      message = offense.message.dup
      message.delete_prefix! offense.cop_name
      message.delete_prefix! ':'
      message.strip!

      hash = {
        type: :issue,
        check_name: name,
        description: message,
        categories: [category || 'General'],
        location: hash_for_location(file, offense),
        severity: SEVERITY_MAP[offense.severity.name],
      }
      hash[:fingerprint] = Digest::SHA2.hexdigest([file, offense.cop_name, offense.line, offense.column].to_json)
      hash
    end
  end

  def hash_for_location(file, offense)
    {
      path: smart_path(file),
      positions: {
        begin: {
          line: offense.line,
          column: offense.real_column,
        },
        end: {
          line: offense.last_line,
          column: offense.last_column.zero? ? 1 : offense.last_column,
        },
      },
    }
  end
end
