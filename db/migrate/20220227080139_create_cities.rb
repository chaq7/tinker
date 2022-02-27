class CreateCities < ActiveRecord::Migration[6.1]
  def change
    create_table :cities do |t|
      t.integer :name
      t.integer :location_id

      t.timestamps
    end
  end
end
