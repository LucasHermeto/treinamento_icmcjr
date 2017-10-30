class AddClientIdToQualifications < ActiveRecord::Migration
  def change
    add_index(:qualifications, :client_id)
    add_index(:qualifications, :restaurant_id)
  end
end
