# frozen_string_literal: true

require 'voxpupuli/test/facts'
require 'rspec-puppet'

spec_path = File.expand_path(File.join(Dir.pwd, 'spec'))
module_path = File.join(spec_path, 'fixtures', 'modules')

# Add all spec lib dirs to LOAD_PATH
Dir.glob(File.join(module_path, '*', 'spec', 'lib')).each do |d|
  $LOAD_PATH << d if FileTest.directory?(d) && !$LOAD_PATH.include?(d)
end

RSpec.configure do |config|
  if ENV['GITHUB_ACTIONS'] == 'true'
    config.formatter = 'RSpec::Github::Formatter'
  end

  config.environmentpath = spec_path

  config.module_path = module_path
  config.strict_variables = true

  # This completely disables Facter and uses a stubbed implementation. This is
  # fine since we use use rspec-puppet-facts to set all facts. It gives
  # complete isolation from the host system. It only works with Puppet 6.25+
  # and 7.12+ and requires rspec-puppet 2.11.0+.
  config.facter_implementation = 'rspec'

  # In the next major release we will flip this to true
  config.facterdb_string_keys = false

  config.before :each do
    if config.mock_framework.framework_name == :rspec
      allow(Puppet.features).to receive(:root?).and_return(true)
    else
      Puppet.features.stubs(:root?).returns(true)
    end
  end

  config.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end

# Puppet 8 remove Legacy Facts and enable Strict Mode:
# https://github.com/puppetlabs/puppet/wiki/Puppet-8-Compatibility#legacy-facts
# https://github.com/puppetlabs/puppet/wiki/Puppet-8-Compatibility#strict-mode
#
# We want to use these settings as a common denominator for all versions of
# Puppet with test modules against.
Puppet[:include_legacy_facts] = false
Puppet[:strict_variables] = true
Puppet[:strict] = :error

if ENV['DEBUG']
  Puppet::Util::Log.level = :debug
  Puppet::Util::Log.newdestination(:console)
end
