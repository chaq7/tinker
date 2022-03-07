class WeatherForecastsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!
  before_action :set_my_city_ids, only: [:edit, :update]
  before_action :set_all_cities, only: [:edit, :update]

  def index
  end

  def edit
    @city_users = CityUser.where(user_id: @user.id)
  end

  def update
    if params[:city_user].blank?
      flash.now[:notice] = '地域を選択してください'
      render action: :edit
    else
      selected_city_ids = params[:city_user][:city_ids].map(&:to_i)
      CityUser.update_my_cities(@user.id, selected_city_ids, @my_city_ids)
      redirect_to weather_forecasts_path, notice: "地域設定を更新しました。"
    end
  end

  private

  def set_my_city_ids
    @my_city_ids = CityUser.where(user_id: @user.id).pluck(:city_id).uniq
  end

  def set_all_cities
    @all_cities = City.all
  end

end
