task :import_set, [:csv] => :environment do |task, args|
  desc "Import an entire card set specified in a csv"
  desc "Argument: csv name without extension"

  CardSetImporter.new(csv_name: args[:csv]).import
end

