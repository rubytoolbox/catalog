# frozen_string_literal: true

require "pp"
RSpec.describe Catalog do
  it "can be represented as_json" do
    expect(described_class.new.as_json).to be_a Hash
  end
end
