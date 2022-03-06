class City < ApplicationRecord
  has_many :weather_forecasts
  has_many :city_user
  has_many :user, through: :city_user

  def self.all_id_and_name
    City.select('id', 'name').includes(:city_user).all
  end
end
