class CreateCityUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :city_users do |t|
      t.integer :city_id
      t.integer :user_id

      t.timestamps
    end
  end
end
