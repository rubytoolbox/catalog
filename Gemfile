# frozen_string_literal: true

source "https://rubygems.org"

ruby File.read(File.join(__dir__, ".ruby-version")).strip

gem "json-schema"
gem "rake"

group :test do
  gem "rspec"
  gem "simplecov"
end

group :development, :test do
  gem "pry"
end

group :development do
  gem "guard-bundler", require: false
  gem "guard-rspec", require: false
  gem "guard-rubocop", require: false

  gem "overcommit", require: false

  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rspec", require: false
end
