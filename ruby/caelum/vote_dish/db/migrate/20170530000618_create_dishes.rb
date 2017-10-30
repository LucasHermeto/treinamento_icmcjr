class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.string :name, limit: 80

      t.timestamps null: false
    end
  end
end
