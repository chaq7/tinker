class ChangeColumnToCity < ActiveRecord::Migration[6.1]

  def up
    change_column :cities, :name, :string, null: false
  end

  def down
    change_column :cities, :name, :intager, null: false, default: 0
  end

end
