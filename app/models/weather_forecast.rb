class WeatherForecast < ApplicationRecord
  belongs_to :city

  WEATHER_IMAGE_DIR = "weathers/"
  PNG_FILE_FORMAT = ".png"

  scope :recent_target_date, lambda {
    order(target_date: :asc)
  }
  scope :city_id_asc, lambda {
    order(city_id: :asc)
  }

  def self.my_weather_forecasts(city_ids)
    self.where(city_id: city_ids).city_id_asc.recent_target_date.eager_load(:city).all
  end

  def ditsplay_weather_image
    select_weather_image
  end

  def display_rainfall
    if self.rainfall.nil?
      "0％"
    else
      "#{self.rainfall * 100}％"
    end
  end

  private

  def select_weather_image
    WEATHER_IMAGE_DIR + weather_type + PNG_FILE_FORMAT
  end

  def weather_type
    case self.weather_id
    when 200..299 then "thunderstorm"
    when 300..399 then "shower_rain"
    when 500..504 then "rain"
    when 511      then "snow"
    when 520..531 then "shower_rain"
    when 600..699 then "snow"
    when 700..799 then "mist"
    when 800      then "clear_sky"
    when 801      then "few_clouds"
    when 802      then "scattered_clouds"
    when 803..804 then "broken_clouds"
    else "unknown"
    end
  end

end
