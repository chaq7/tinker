class WeatherForecast < ApplicationRecord
  belongs_to :city

  scope :recent_target_date, lambda {
    order(target_date: :asc)
  }

  def self.specify_city(city_id)
    WeatherForecast.recent_target_date.where(city_id: city_id).all
  end

end
