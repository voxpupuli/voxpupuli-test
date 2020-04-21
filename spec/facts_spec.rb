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
          'minor' => '7'
        },
      }
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
            'minor' => '7'
          },
        }
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
            'minor' => '7'
          },
        },
        ruby: {
          'sitedir' => '/usr/local/share/ruby/site_ruby',
        }
      }
    end

    it { expect(override_facts(base_facts, ruby: {sitedir: '/usr/local/share/ruby/site_ruby'})).to eq(expected) }
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
            'minor' => '8'
          },
        }
      }
    end

    it { expect(override_facts(base_facts, os: {release: {minor: '8'}})).to eq(expected) }
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
            'minor' => '8'
          },
        }
      }
    end

    it { expect(override_facts(base_facts, os: {'release' => {minor: '8'}})).to eq(expected) }
  end
end
