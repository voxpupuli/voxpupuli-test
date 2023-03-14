require 'rspec-puppet-facts'
include RspecPuppetFacts

# Override facts
#
# This doesn't use deep_merge because that's highly unpredictable. It can merge
# nested hashes in place, modifying the original. It's also unable to override
# true to false.
#
# A deep copy is obtained by using Marshal so it can be modified in place. Then
# it recursively overrides values. If the result is a hash, it's recursed into.
#
# A typical example:
#
# let(:facts) do
#   override_facts(super(), os: {'selinux' => {'enabled' => false}})
# end
def override_facts(base_facts, **overrides)
  facts = Marshal.load(Marshal.dump(base_facts))
  apply_overrides!(facts, overrides, false)
  facts
end

# A private helper to override_facts
def apply_overrides!(facts, overrides, enforce_strings)
  overrides.each do |key, value|
    # Nested facts are strings
    key = key.to_s if enforce_strings

    if value.is_a?(Hash)
      facts[key] = {} unless facts.key?(key)
      apply_overrides!(facts[key], value, true)
    else
      facts[key] = value
    end
  end
end

# Add mocked facts based on the metadata present in the module
#
# This means that for some module there are hardcoded mocks, such as stdlib.
# When stdlib is present in metadata.json, facts like service_provider are
# mocked and return the correct value according to the OS facts.
def add_mocked_facts!
  add_facts_for_metadata(RspecPuppetFacts.metadata)
end

def add_facts_for_metadata(metadata)
  return unless metadata && metadata['dependencies']

  metadata['dependencies'].each do |dependency|
    case normalize_module_name(dependency['name'])
    when 'camptocamp/systemd', 'puppet/systemd'
      add_custom_fact :systemd, ->(_os, facts) { facts['service_provider'] == 'systemd' }
    when 'puppetlabs/stdlib'
      add_stdlib_facts
    end
  end
end

def normalize_module_name(name)
  return unless name
  name.sub('-', '/')
end

def add_stdlib_facts
  add_custom_fact :puppet_environmentpath, '/etc/puppetlabs/code/environments'
  add_custom_fact :puppet_vardir, '/opt/puppetlabs/puppet/cache'
  add_custom_fact :root_home, '/root'

  # Rough conversion of grepping in the puppet source:
  # grep defaultfor lib/puppet/provider/service/*.rb
  add_custom_fact :service_provider, ->(_os, facts) do
    os = RSpec.configuration.facterdb_string_keys ? facts['os'] : facts[:os]
    case os['family'].downcase
    when 'archlinux'
      'systemd'
    when 'darwin'
      'launchd'
    when 'debian'
      'systemd'
    when 'freebsd'
      'freebsd'
    when 'gentoo'
      'openrc'
    when 'openbsd'
      'openbsd'
    when 'redhat'
      os['release']['major'].to_i >= 7 ? 'systemd' : 'redhat'
    when 'suse'
      os['release']['major'].to_i >= 12 ? 'systemd' : 'redhat'
    when 'windows'
      'windows'
    else
      'init'
    end
  end
end
