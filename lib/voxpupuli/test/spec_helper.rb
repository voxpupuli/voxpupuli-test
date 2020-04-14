# getting the correct facter version is tricky. We use facterdb as a source to mock facts
# see https://github.com/camptocamp/facterdb
# people might provide a specific facter version. In that case we use it.
# Otherwise we need to match the correct facter version to the used puppet version.
# as of 2019-10-31, puppet 5 ships facter 3.11 and puppet 6 ships facter 3.14
# https://puppet.com/docs/puppet/5.5/about_agent.html
#
# The environment variable `PUPPET_VERSION` is available in our travis environment, but we cannot rely on it
# if somebody runs the tests locally. For that case we should fallback the the puppet gem version.
def suggest_facter_version
  return ENV['FACTERDB_FACTS_VERSION'] if ENV['FACTERDB_FACTS_VERSION']

  require 'bundler'
  puppet_version = ENV['PUPPET_VERSION'] ? ENV['PUPPET_VERSION'] : Gem.loaded_specs['puppet'].version.to_s
  Gem::Dependency.new('', puppet_version).match?('', '5') ? '3.11.0' : '3.14.0'
end

RSpec.configure do |config|
  # puppetlabs_spec_helper defaults to mocha but emits a deprecation warning
  # Vox Pupuli prefers rspec to avoid the deprecation warning unless explicitly
  # set
  if config.instance_variable_get(:@mock_framework).nil?
    config.mock_with :rspec
  end
end

require 'voxpupuli/test/matchers'
require 'puppetlabs_spec_helper/module_spec_helper'
require 'rspec-puppet-facts'
include RspecPuppetFacts

# Generating facts is slow - this memoizes the facts between multiple classes.
# Marshalling is used to get unique instances which helps when tests overrides
# facts.
FACTS_CACHE = {}
def on_supported_os(opts = {})
  result = FACTS_CACHE[opts.to_s] ||= super(opts)
  Marshal.load(Marshal.dump(result))
end

RSpec.configure do |config|
  config.default_facter_version = suggest_facter_version

  # Coverage generation
  config.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end

if ENV['DEBUG']
  Puppet::Util::Log.level = :debug
  Puppet::Util::Log.newdestination(:console)
end
