class WeatherForecastsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!

  def index
  end

  def edit
  end

  def update
    if params[:user].nil?
      flash.now[:notice] = '地域を選択してください'
      render action: :edit
    else
      city_ids = params[:user][:city_users]
      CityUser.update_setting_cities(@user.id, city_ids)
      redirect_to weather_forecasts_path, notice: "地域設定を更新しました。"
    end
  end

end
