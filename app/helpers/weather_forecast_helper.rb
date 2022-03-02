module WeatherForecastHelper

    def specify_city_weather_forecasts(city_id)
      WeatherForecast.specify_city(city_id)
    end

end
