task :import_set, [:csv] => :environment do |task, args|
  desc "Import an entire card set specified in a csv"
  CardSetImporter.new(args[:csv]).import
end

