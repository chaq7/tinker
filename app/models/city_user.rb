class CityUser < ApplicationRecord
  belongs_to :user
  belongs_to :city

  def self.update_setting_cities(user_id, city_ids)
    city_ids.each do |city_id|
      self.create!(user_id: user_id, city_id: city_id) unless CityUser.exists?(user_id: user_id, city_id: city_id)
    end
    self.where.not(user_id: user_id, city_id: city_ids).delete_all
  end

end
