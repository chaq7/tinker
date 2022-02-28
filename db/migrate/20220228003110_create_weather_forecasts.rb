class CreateWeatherForecasts < ActiveRecord::Migration[6.1]
  def change
    create_table :weather_forecasts do |t|
      t.float :temp_max
      t.float :temp_min
      t.float :temp_feel
      t.integer :weather_id
      t.float :rainfall
      t.datetime :target_date
      t.datetime :aquired_at
      t.integer :city_id

      t.timestamps
    end
  end
end
