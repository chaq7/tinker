class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :city_users
  has_many :city, through: :city_users
  accepts_nested_attributes_for :city_users, allow_destroy: true

end
