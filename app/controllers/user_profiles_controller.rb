class UserProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user!

  def edit
  end

  def update
    city_ids = params[:user][:city_users].compact.reject(&:empty?)
    CityUser.update_setting_cities(@user.id, city_ids)

    redirect_to root_path, notice: "更新しました。"
  end

end
