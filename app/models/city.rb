class City < ApplicationRecord
  has_many :weather_forecasts
  has_many :city_user
  has_many :user, through: :city_user

  def self.all_name_and_id
    cities = []
    City.find_each do |city|
      cities << [city.name, city.id]
    end
    cities
  end
end
