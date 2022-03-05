require "test_helper"

class WeatherForecastsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get weather_forecasts_edit_url
    assert_response :success
  end

  test "should get update" do
    get weather_forecasts_update_url
    assert_response :success
  end

  test "should get index" do
    get weather_forecasts_index_url
    assert_response :success
  end
end
