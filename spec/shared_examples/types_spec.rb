# frozen_string_literal: true

require 'spec_helper'

VoxpupuliTestType = Puppet::Type.newtype(:voxpupuli_test_type) do
  @doc = 'A type to run the shared examples against.'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The name of the thing.'
  end

  newproperty(:colour) do
    desc 'The colour of the thing.'
  end
end

describe VoxpupuliTestType do
  it_behaves_like 'a type that works with `puppet generate types`'
  it_behaves_like 'a documented type'
  it_behaves_like 'an ensurable type'
end
