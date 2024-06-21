# frozen_string_literal: true

require 'voxpupuli/test/facts'
require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |config|
  # This completely disables Facter and uses a stubbed implementation. This is
  # fine since we use use rspec-puppet-facts to set all facts. It gives
  # complete isolation from the host system. It only works with Puppet 6.25+
  # and 7.12+ and requires rspec-puppet 2.11.0+.
  config.facter_implementation = 'rspec'

  # In the next major release we will flip this to true
  config.facterdb_string_keys = false

  config.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end

if ENV['DEBUG']
  Puppet::Util::Log.level = :debug
  Puppet::Util::Log.newdestination(:console)
end
