class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :local
      t.datetime :start
      t.datetime :end

      t.timestamps null: false
    end
  end
end
