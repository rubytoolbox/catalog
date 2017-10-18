# frozen_string_literal: true

source "https://rubygems.org"

ruby File.read(File.join(__dir__, ".ruby-version")).strip

gem "json-schema"
gem "rake"

group :test do
  gem "rspec"
  gem "simplecov"
end

group :development do
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-rubocop"

  gem "overcommit"

  gem "rubocop"
  gem "rubocop-rspec"
end
