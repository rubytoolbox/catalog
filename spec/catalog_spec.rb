# frozen_string_literal: true

require "pp"

SCHEMA = {
  "$schema" => "http://json-schema.org/draft-04/schema#",
  title: "The Ruby Toolbox Catalog",
  type: :object,
  required: %i[category_groups],
  properties: {
    category_groups: {
      type: :array,
      minItems: 1,
      items: {
        additionalProperties: false,
        required: %i[name permalink description categories],
        properties: {
          name: {
            type: :string,
          },
          permalink: {
            type: :string,
            pattern: "^([A-Za-z0-9\\/\\-_]{3,30})$",
          },
          description: {
            type: [:string, nil],
          },
          categories: {
            type: :array,
            minItems: 1,
            items: {
              additionalProperties: false,
              required: %i[name permalink description projects],
              properties: {
                name: {
                  type: :string,
                },
                permalink: {
                  type: :string,
                  pattern: "^([A-Za-z0-9\\/\\-_]{3,30})$",
                },
                description: {
                  type: [:string, nil],
                },
                projects: {
                  type: :array,
                  items: {
                    type: :string,
                    pattern: "^([A-Za-z0-9\\/\\-\\._]{1,50})$",
                  },
                },
              },
            },
          },
        },
      },
    },
  },
}.freeze

RSpec.describe Catalog do
  it "can be represented as_json" do
    expect(described_class.new.as_json).to be_a Hash
  end

  it "validates against the schema" do
    validation = JSON::Validator.fully_validate(SCHEMA, described_class.new.as_json)
    # Cheating for better error reporting...
    pp validation unless validation.empty?
    expect(validation).to be_empty
  end
end
