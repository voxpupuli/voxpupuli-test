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

# Additional matchers

Suppose there's the following Puppet definition, it can be tested as follows:

```puppet
$content = @(END)
# See the qdrouterd.conf (5) manual page for information about this
# file's format and options.

router {
  id: ${facts['networking']['fqdn']}
  mode: interior
  worker-threads: ${facts['processors']['count']}
}
END

concat::fragment { 'qdrouter+header.conf':
  target  => '/etc/qpid-dispatch/qdrouterd.conf,
  content => $content,
  order   => '01',
}
```

Normally this can be verified using `contain_concat__fragment('qdrouter+header.conf').with_content()`, but that means you have to specify all comments as well. Usually those are not very interesting. Another option is to use [verify_contents](https://github.com/puppetlabs/puppetlabs_spec_helper/blob/070ecb79a63cb8fa10f46532c413c055e2697682/lib/puppetlabs_spec_helper/module_spec_helper.rb#L9-L12) from [puppetlabs_spec_helper](https://github.com/puppetlabs/puppetlabs_spec_helper) but that has an awkward syntax and is limited to `file` resources.

This gem patches [rspec-puppet](https://rspec-puppet.com/) to provide `that_has_content` and `that_has_exact_content` matchers on resources. That means there's now two ways to test tour code.


```ruby
# Classic way: just verify the line with a variable
it do
  is_expected.to contain_concat__fragment('qdrouter+header.conf')
    .with_content(%r{^    id: foo\.example\.com$})
    .with_content(%r{^    worker-threads: 2$})
end
```

```ruby
# Verify some lines are present and correct, ignore some
it do
  is_expected.to contain_concat__fragment('qdrouter+header.conf').that_has_content(
    <<~CONTENT
          id: foo.example.com
          worker-threads: 2
    CONTENT
  )
end
```

```ruby
# Verify all non-comment lines match exactly
it do
  is_expected.to contain_concat__fragment('qdrouter+header.conf').that_has_exact_content(
    <<~CONTENT
      router {
          id: foo.example.com
          mode: interior
          worker-threads: 2
      }
    CONTENT
  )
end
```
