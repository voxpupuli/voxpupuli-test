# frozen_string_literal: true

require 'spec_helper'
require 'voxpupuli/test/facts'

describe 'override_facts' do
  let(:base_facts) do
    {
      os: {
        'family' => 'RedHat',
        'name' => 'CentOS',
        'release' => {
          'full' => '7.7.1908',
          'major' => '7',
          'minor' => '7',
        },
      },
    }
  end

  describe 'no overrides' do
    let(:expected) do
      {
        os: {
          'family' => 'RedHat',
          'name' => 'CentOS',
          'release' => {
            'full' => '7.7.1908',
            'major' => '7',
            'minor' => '7',
          },
        },
      }
    end

    it { expect(override_facts(base_facts)).to eq(expected) }
  end

  describe 'with addition at the top level' do
    let(:expected) do
      {
        os: {
          'family' => 'RedHat',
          'name' => 'CentOS',
          'release' => {
            'full' => '7.7.1908',
            'major' => '7',
            'minor' => '7',
          },
        },
        ruby: {
          'sitedir' => '/usr/local/share/ruby/site_ruby',
        },
      }
    end

    it { expect(override_facts(base_facts, ruby: { sitedir: '/usr/local/share/ruby/site_ruby' })).to eq(expected) }
  end

  describe 'with deep merging' do
    let(:expected) do
      {
        os: {
          'family' => 'RedHat',
          'name' => 'CentOS',
          'release' => {
            'full' => '7.7.1908',
            'major' => '7',
            'minor' => '8',
          },
        },
      }
    end

    it { expect(override_facts(base_facts, os: { release: { minor: '8' } })).to eq(expected) }
  end

  describe 'with strings' do
    let(:expected) do
      {
        os: {
          'family' => 'RedHat',
          'name' => 'CentOS',
          'release' => {
            'full' => '7.7.1908',
            'major' => '7',
            'minor' => '8',
          },
        },
      }
    end

    it { expect(override_facts(base_facts, os: { 'release' => { minor: '8' } })).to eq(expected) }
  end
end

describe 'add_facts_for_metadata' do
  before { RspecPuppetFacts.reset }

  after { RspecPuppetFacts.reset }

  let(:metadata) do
    { 'dependencies' => dependencies }
  end

  context 'without dependencies' do
    let(:dependencies) { [] }

    it 'does not call add_custom_fact' do
      expect(RspecPuppetFacts).not_to receive(:register_custom_fact)
      add_facts_for_metadata(metadata)
    end
  end

  context 'with systemd' do
    let(:dependencies) do
      [
        { 'name' => 'puppet/systemd' },
      ]
    end

    it 'adds the systemd fact' do
      expect(RspecPuppetFacts).to receive(:register_custom_fact).with(:systemd, instance_of(Proc), {})
      add_facts_for_metadata(metadata)
    end

    context 'and stdlib' do
      let(:dependencies) do
        [
          { 'name' => 'puppetlabs/stdlib' },
          { 'name' => 'puppet/systemd' },
        ]
      end

      it 'has systemd on Red Hat 7' do
        add_facts_for_metadata(metadata)
        facts = RspecPuppetFacts.with_custom_facts('redhat-7-x86_64', { osfamily: 'RedHat', operatingsystemmajrelease: '7' })
        expect(facts['systemd']).to be true
      end

      it 'has no systemd on Red Hat 6' do
        add_facts_for_metadata(metadata)
        facts = RspecPuppetFacts.with_custom_facts('redhat-6-x86_64', { osfamily: 'RedHat', operatingsystemmajrelease: '6' })
        expect(facts['systemd']).to be false
      end

      it 'has no systemd on openbsd' do
        add_facts_for_metadata(metadata)
        facts = RspecPuppetFacts.with_custom_facts('openbsd-6.4-x86_64', { osfamily: 'OpenBSD' })
        expect(facts['systemd']).to be false
      end
    end
  end

  context 'with stdlib' do
    let(:dependencies) do
      [
        { 'name' => 'puppetlabs/stdlib' },
      ]
    end

    it 'adds the systemd fact' do
      expect(RspecPuppetFacts).to receive(:register_custom_fact).with(:puppet_environmentpath, '/etc/puppetlabs/code/environments', {})
      expect(RspecPuppetFacts).to receive(:register_custom_fact).with(:puppet_vardir, '/opt/puppetlabs/puppet/cache', {})
      expect(RspecPuppetFacts).to receive(:register_custom_fact).with(:root_home, '/root', {})
      expect(RspecPuppetFacts).to receive(:register_custom_fact).with(:service_provider, instance_of(Proc), {})
      add_facts_for_metadata(metadata)
    end
  end
end
