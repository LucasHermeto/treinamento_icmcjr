class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.integer :client_id
      t.integer :restaurant_id
      t.float :remark
      t.float :spend
      t.timestamps null: false
    end
  end
end
