require 'csv'

module Seeds
  module Metrics
    class MetricsSeed

      def self.execute
        puts 'START: Seeding metrics'
        csv_text = File.read(Rails.root.join('lib', 'seeds', 'metrics', 'metrics.csv'))
        csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
        csv.each do |row|
          found = Metric.find_by(name: row['name'])
          unless found
            new_metric = Metric.create!({
                                        name: row['name']
                                      })
            puts "Created new metric: #{new_metric.name}"
          end
        end
        puts "There are now #{Metric.count} rows in the metrics table"
        puts 'FINISH: Seeding metrics'
      end
    end
  end
end
