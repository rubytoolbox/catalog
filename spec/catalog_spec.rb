# frozen_string_literal: true

require "pp"
require "tempfile"

RSpec.describe Catalog do
  it "can be represented as_json" do
    expect(described_class.new.as_json).to be_a Hash
  end

  describe "#export" do
    it "exports the JSON catalog to a file" do
      Tempfile.open("json-export") do |f|
        expect { described_class.new.export(path: f.path) }
          .to change { File.read(f.path) }
          .from("").to("#{JSON.pretty_generate(described_class.new.as_json)}\n")
      end
    end
  end

  it "validates against the schema" do
    validation = JSON::Validator.fully_validate(described_class.schema, described_class.new.as_json)
    # Cheating for better error reporting...
    pp validation unless validation.empty?
    expect(validation).to be_empty
  end

  described_class.new.as_json[:category_groups].map { |group| group[:categories] }.flatten.each do |category|
    describe "Category #{category['name'].inspect}" do
      it "defines all projects in alphabetical order" do
        expected_order = category["projects"].sort_by(&:downcase)
        expect(category["projects"]).to be == expected_order
      end
    end
  end
end
