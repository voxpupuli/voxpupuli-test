# frozen_string_literal: true

# Shared examples for the providers of custom types.
#
#   describe Puppet::Type.type(:my_type).provider(:my_provider) do
#     it_behaves_like 'a documented provider'
#   end

# A provider's `desc` ends up in REFERENCE.md, like a type's.
RSpec.shared_examples 'a documented provider' do
  it 'has documentation' do
    expect(described_class.doc.to_s.strip).not_to be_empty
  end
end
