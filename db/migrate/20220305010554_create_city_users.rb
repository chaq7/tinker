class CreateCityUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :city_users do |t|
      t.intager :city_id
      t.intager :user_id

      t.timestamps
    end
  end
end
