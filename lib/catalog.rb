# frozen_string_literal: true

ENV["RACK_ENV"] ||= "development"

require "pathname"
require "yaml"
require "bundler"
Bundler.require :default, ENV["RACK_ENV"]

class Catalog
  attr_accessor :root
  private :root=

  def self.schema
    YAML.safe_load Pathname.new(__dir__).join("..", "json-schema.yml").read
  end

  def initialize(root: File.join(__dir__, "../catalog"))
    self.root = Pathname.new(root).expand_path
  end

  def as_json
    {
      category_groups: category_groups,
    }
  end

  def export(path: File.join(__dir__, "../build/catalog.json"))
    File.open(path, "w+") do |f|
      f.puts JSON.pretty_generate(as_json)
    end
  end

  private

  def category_groups
    @category_groups ||= Dir[root.join("*")].map do |path|
      meta = YAML.safe_load Pathname.new(path).join("_meta.yml").read
      {
        categories: categories_at(path),
        description: meta["description"],
        name: meta["name"],
        permalink: File.basename(path),
      }
    end
  end

  def categories_at(path)
    Dir[File.join(path, "*.yml")].reject { |file_path| File.basename(file_path) == "_meta.yml" }.map do |category_path|
      YAML.safe_load(File.read(category_path)).merge(permalink: File.basename(category_path).gsub(".yml", ""))
    end
  end
end
