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
