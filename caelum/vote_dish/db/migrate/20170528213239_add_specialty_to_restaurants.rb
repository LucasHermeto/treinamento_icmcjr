class AddSpecialtyToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :specialty, :string, limit: 40
  end
end
