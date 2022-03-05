module WeatherForecastsHelper

  def my_city_weather_forecasts(user_id)
    city_ids = CityUser.my_city_ids(user_id)
    WeatherForecast.my_weather_forecasts(city_ids)
  end

end
