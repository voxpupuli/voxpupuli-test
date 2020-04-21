# Voxpupuli Test Gem

This is a helper Gem to test the various Vox Pupuli Puppet modules. This Gem currently serves only to encapsulate common `rake` tasks related to releasing modules. The aim is to reduce the boiler plate and need for modulesync.

# Usage
Add the `voxpupuli-test` Gem to your `Gemfile`:

```ruby
gem 'voxpupuli-test'
```

Then, at the top of your `Rakefile`, add:

```ruby
require 'voxpupuli/test/rake'
```

In your `spec/spec_helper.rb`

```ruby
require 'voxpupuli/test/spec_helper'
```

# Fact handling

The recommended method is using [rspec-puppet-facts](https://github.com/mcanevet/rspec-puppet-facts) and is set up by default. This means the tests are writting as follows:

```ruby
require 'spec_helper'

describe 'myclass' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
    end
  end
end
```

Now a common case is to override facts in tests. Let's take the example of SELinux with legacy facts.

```ruby
require 'spec_helper'

describe 'mytool' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      describe 'with SELinux enabled' do
        let(:facts) { super().merge(selinux: true) }

        it { is_expected.to contain_package('mytool-selinux') }
      end

      describe 'with SELinux disabled' do
        let(:facts) { super().merge(selinux: false) }

        it { is_expected.not_to contain_package('mytool-selinux') }
      end
    end
  end
end
```

This is all fairly straight forward, but it gets more complex when using modern facts. Modern facts are nested which means you need to do deep merging. There is [deep_merge](https://rubygems.org/gems/deep_merge) but its results are not at all useful for spec testing. That's why voxpupuli-test has an `override_facts` helper.

```ruby
require 'spec_helper'

describe 'mytool' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }

      describe 'with SELinux enabled' do
        let(:facts) { override_facts(super(), os: {selinux: {enabled: true}}) }

        it { is_expected.to contain_package('mytool-selinux') }
      end

      describe 'with SELinux disabled' do
        let(:facts) { override_facts(super(), os: {selinux: {enabled: false}}) }

        it { is_expected.not_to contain_package('mytool-selinux') }
      end
    end
  end
end
```

Note that this helper deals with symbols/strings for you as well.
