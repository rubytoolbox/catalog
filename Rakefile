# frozen_string_literal: true

task :environment do
  require File.join(__dir__, "lib/catalog")
end

desc "Generates and exports the catalog to the default location"
task export: :environment do
  Catalog.new.export
end
