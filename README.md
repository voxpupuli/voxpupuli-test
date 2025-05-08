# Voxpupuli Test Gem

[![License](https://img.shields.io/github/license/voxpupuli/voxpupuli-test.svg)](https://github.com/voxpupuli/voxpupuli-test/blob/master/LICENSE)
[![Test](https://github.com/voxpupuli/voxpupuli-test/actions/workflows/test.yml/badge.svg)](https://github.com/voxpupuli/voxpupuli-test/actions/workflows/test.yml)
[![Release](https://github.com/voxpupuli/voxpupuli-test/actions/workflows/release.yml/badge.svg)](https://github.com/voxpupuli/voxpupuli-test/actions/workflows/release.yml)
[![RubyGem Version](https://img.shields.io/gem/v/voxpupuli-test.svg)](https://rubygems.org/gems/voxpupuli-test)
[![RubyGem Downloads](https://img.shields.io/gem/dt/voxpupuli-test.svg)](https://rubygems.org/gems/voxpupuli-test)

This is a helper Gem to test the various Vox Pupuli Puppet modules.
This Gem provides common functionality for rspec-puppet based testing and static code analysis.
The aim is to reduce the boiler plate and need for modulesync.

## Usage

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

In your `.rubocop.yml` (see [Rubocop's documentation](https://docs.rubocop.org/rubocop/configuration.html#inheriting-configuration-from-a-dependency-gem)).

```yaml
inherit_gem:
  voxpupuli-test: rubocop.yml
```

To run the linter, the syntax checker and the unit tests:

```sh
bundle exec rake test
```

To run your all the unit tests:

```sh
bundle exec rake spec
```

To run a specific spec test set the `SPEC` variable:

```sh
SPEC=spec/classes/foo_spec.rb bundle exec rake spec
```

To run all the static code analysis and linting:

```sh
bundle exec rake validate lint check rubocop
```


To autocorrect Puppet files:

```sh
bundle exec rake lint_fix
```

To autocorrect Ruby files:

```sh
bundle exec rake rubocop:autocorrect
```

## Rake tasks

### `check:trailing_whitespace`

The rake task `check:trailing_whitespace` checks for trailing whitespace in all markdown files in the repository.
It has an exclude pattern for: `%r{^((modules|acceptance|\.?vendor|spec/fixtures|pkg)/|REFERENCE.md)}`

We recommend using the GitHub style guide for markdown files, which includes no trailing whitespace.
See [GitHub Markdown Style Guide](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

## Fact handling

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
