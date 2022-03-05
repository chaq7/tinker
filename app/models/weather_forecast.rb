class WeatherForecast < ApplicationRecord
  belongs_to :city

  scope :recent_target_date, lambda {
    order(target_date: :asc)
  }

  def self.my_city_weather_forecasts(user_id)
    self.recent_target_date.where(user_id: user_id).all
  end

  def self.my_weather_forecasts(city_ids)
    self.recent_target_date.where(city_id: city_ids).all
  end

end
