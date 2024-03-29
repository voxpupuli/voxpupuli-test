RSpec.configure do |config|
  # puppetlabs_spec_helper defaults to mocha but emits a deprecation warning
  # Vox Pupuli prefers rspec to avoid the deprecation warning unless explicitly
  # set
  if config.instance_variable_get(:@mock_framework).nil?
    config.mock_with :rspec
  end
end

require 'voxpupuli/test/facts'
require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |config|
  # This completely disables Facter and uses a stubbed implementation. This is
  # fine since we use use rspec-puppet-facts to set all facts. It gives
  # complete isolation from the host system. It only works with Puppet 6.25+
  # and 7.12+ and requires rspec-puppet 2.11.0+.
  config.facter_implementation = 'rspec'

  config.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end

if ENV['DEBUG']
  Puppet::Util::Log.level = :debug
  Puppet::Util::Log.newdestination(:console)
end
