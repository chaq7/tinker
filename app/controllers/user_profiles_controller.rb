class UserProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    city_id = params[:user][:city].to_i

    city_user = CityUser.find_or_initialize_by(user_id: @user.id)
    if city_user.city_id.nil?
      city_user.city_id = city_id
      city_user.save!
    elsif city_user.city_id != city_id
      city_user.update!(city_id: city_id)
    end
    redirect_to root_path, notice: "更新しました。"
  end
end
