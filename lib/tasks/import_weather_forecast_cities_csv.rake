require 'csv'

desc 'Import cities'
  task import_weather_forecast_cities: [:environment] do
    list = []
    CSV.foreach('app/assets/csv/weather_forecast_cities.csv') do |row|
      list << {
        name: row[0],
        location_id: row[1],
      }
    end

    puts 'start creating cities'
    begin
      City.create!(list)
      puts 'completed!'
    rescue ActiveModel::UnknownAttributeError
      puts 'raised error: unknown attributes'
    end
  end
