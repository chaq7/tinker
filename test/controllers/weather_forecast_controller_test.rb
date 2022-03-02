require "test_helper"

class WeatherForecastControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weather_forecast_index_url
    assert_response :success
  end
end
