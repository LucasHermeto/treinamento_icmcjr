class Recipe < ActiveRecord::Base
  validates_presence_of :content, message: " - deve ser preenchido"

  validates_presence_of :dish_id
  validates_associated :dish

  belongs_to :dish
end
