# frozen_string_literal: true

require "pp"

RSpec.describe Catalog do
  it "can be represented as_json" do
    expect(described_class.new.as_json).to be_a Hash
  end

  it "validates against the schema" do
    validation = JSON::Validator.fully_validate(described_class.schema, described_class.new.as_json)
    # Cheating for better error reporting...
    pp validation unless validation.empty?
    expect(validation).to be_empty
  end
end
