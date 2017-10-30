class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.integer :dish_id
      t.text :content
      t.timestamps null: false
    end
  end
end
