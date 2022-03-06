class WeatherForecastsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!
  before_action :set_my_city_ids, only: [:edit, :update]

  def index
  end

  def edit
  end

  def update
    if params[:user].nil?
      flash.now[:notice] = '地域を選択してください'
      render action: :edit
    else
      selected_city_ids = params[:user][:city_users].map(&:to_i)
      CityUser.update_my_cities(@user.id, selected_city_ids, @my_city_ids)
      redirect_to weather_forecasts_path, notice: "地域設定を更新しました。"
    end
  end

  private

  def set_my_city_ids
    @my_city_ids = CityUser.where(user_id: @user.id).pluck(:city_id).uniq
  end

end
