# frozen_string_literal: true

require 'puppet-syntax/tasks/puppet-syntax'
PuppetSyntax.exclude_paths ||= []
PuppetSyntax.exclude_paths << 'spec/fixtures/**/*'
PuppetSyntax.exclude_paths << 'pkg/**/*'
PuppetSyntax.exclude_paths << 'vendor/**/*'
PuppetSyntax.exclude_paths << '.vendor/**/*'
PuppetSyntax.check_hiera_keys = true
PuppetSyntax.check_hiera_data = true
