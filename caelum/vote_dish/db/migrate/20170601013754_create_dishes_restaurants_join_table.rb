class CreateDishesRestaurantsJoinTable < ActiveRecord::Migration
  def change
    create_table :dishes_restaurants, id: false do |t|
      t.integer :dish_id
      t.integer :restaurant_id
    end
  end

  def self.down
    drop_table :dishes_restaurants
  end
end
