# frozen_string_literal: true

require 'puppet/generate/models/type/type'

# Shared examples for custom types.
#
#   describe Puppet::Type.type(:my_type) do
#     it_behaves_like 'a type that works with `puppet generate types`'
#     it_behaves_like 'a documented type'
#     it_behaves_like 'an ensurable type'
#   end

# `puppet generate types` accepts less than `Puppet::Type` does, and a module
# only finds out when an r10k deployment using `--generate-types` fails.
RSpec.shared_examples 'a type that works with `puppet generate types`' do
  it 'does not raise an error' do
    expect { Puppet::Generate::Models::Type::Type.new(described_class) }.not_to raise_error
  end
end

# Anything undocumented here is an empty entry in REFERENCE.md.
RSpec.shared_examples 'a documented type' do
  it 'has documentation' do
    expect(described_class.doc.to_s.strip).not_to be_empty
  end

  it 'documents all parameters and properties' do
    attributes = described_class.validproperties + described_class.parameters

    undocumented = attributes.reject do |name|
      klass = described_class.attrclass(name) || described_class.paramclass(name)
      klass && !klass.doc.to_s.strip.empty?
    end

    expect(undocumented).to be_empty
  end
end

# For types that manage a thing that can be created and removed. Types that use
# `ensure` for something else, e.g. `[:purgable, :purged]`, don't want this.
RSpec.shared_examples 'an ensurable type' do
  it 'is ensurable' do
    expect(described_class.propertybyname(:ensure)).not_to be_nil
  end

  it 'supports present and absent' do
    values = described_class.propertybyname(:ensure)&.value_collection&.values

    expect(values).to include(:present, :absent)
  end
end
