class CityUser < ApplicationRecord
  belongs_to :user
  belongs_to :city

  with_options presence: true, numericality: { only_integer: true } do
    validates :user_id
    validates :city_id
  end

  def self.update_my_cities(user_id, selected_city_ids, my_city_ids)
    selected_city_ids.each do |selected_city_id|
      self.create!(user_id: user_id, city_id: selected_city_id) unless my_city_ids.include?(selected_city_id)
    end
    self.where.not(user_id: user_id, city_id: selected_city_ids).delete_all
  end

  def self.my_city_ids(user_id)
    self.where(user_id: user_id).pluck(:city_id)
  end

end
