require 'rspec-puppet'

class LineParameterMatcher < RSpec::Puppet::ManifestMatchers::ParameterMatcher
  def initialize(parameter, value, type, exact, strip_comments = true)
    super(parameter, value, type)

    @exact = exact
    @strip_comments = strip_comments
  end

  def get_lines(resource)
    value = resource[@parameter]

    lines = if value.is_a?(String)
              value.split("\n")
            elsif value.is_a?(Array)
              value
            end

    return unless lines

    if @strip_comments
      lines = lines.reject { |line| line =~ /^(\s*#|$)/ }
    end

    unless @exact
      lines = lines & @value.split("\n")
    end

    lines.join("\n")
  end

  # Ensure that the actual parameter matches the expected parameter.
  #
  # @param resource [Hash<Symbol, Object>] A hash representing a Puppet
  #   resource in the catalog
  #
  # @return [true, false]
  def matches?(resource)
    actual = get_lines(resource)
    return false unless actual

    expected = @value.rstrip

    retval = check(expected, actual)

    unless retval
      @errors << MatchError.new(@parameter, expected, actual, !@should_match)
    end

    retval
  end
end

module MatcherExtensions
  def initialize(*args, &block)
    super(*args, &block)

    @expected_line_params = []
  end

  def that_has_content(content)
    @expected_line_params << ['content', content, false]
    self
  end

  def that_has_exact_content(content)
    @expected_line_params << ['content', content, true]
    self
  end

  def matches?(catalogue)
    result = super(catalogue)
    return result unless @catalogue

    resource = @catalogue.resource(@referenced_type, @title)
    return result unless resource

    check_line_params(resource, @expected_line_params, :should)

    @errors.empty?
  end

  # @param resource [Hash<Symbol, Object>] The resource in the catalog
  # @param list [Array<String, Object>] The expected values of the resource
  # @param type [:should, :not] Whether the given parameters should/not match
  def check_line_params(resource, list, type)
    list.each do |param, value, exact|
      param = param.to_sym

      if value.nil? then
        unless resource[param].nil?
          @errors << "#{param} undefined but it is set to #{resource[param].inspect}"
        end
      else
        m = LineParameterMatcher.new(param, value, type, exact)
        unless m.matches?(resource)
          @errors.concat m.errors
        end
      end
    end
  end
end

module RSpec::Puppet
  module ManifestMatchers
    class CreateGeneric
      prepend MatcherExtensions
    end
  end
end
