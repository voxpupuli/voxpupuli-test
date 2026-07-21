# frozen_string_literal: true

require 'spec_helper'

VoxpupuliTestProviderType = Puppet::Type.newtype(:voxpupuli_test_provider_type) do
  @doc = 'A type to hang the provider off.'

  newparam(:name, namevar: true) do
    desc 'The name of the thing.'
  end
end

VoxpupuliTestProvider = VoxpupuliTestProviderType.provide(:voxpupuli_test_provider) do
  desc 'A provider to run the shared examples against.'
end

describe VoxpupuliTestProvider do
  it_behaves_like 'a documented provider'
end
