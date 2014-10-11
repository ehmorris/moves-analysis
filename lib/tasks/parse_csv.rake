namespace :parse_csv do
  task :populateDatabase => :environment do
    require 'csv'

    csv_text = File.read('public/places.csv')
    csv = CSV.parse(csv_text, :headers => true, :header_converters => lambda { |h| h.try(:downcase) })

    csv.each do |row|
      Place.create(row.to_hash).save
    end
  end
end
