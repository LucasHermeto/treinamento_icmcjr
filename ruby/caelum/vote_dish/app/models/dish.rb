class Dish < ActiveRecord::Base
  validates_presence_of :name, message: " - Deve ser preenchido"
  validates_presence_of :name, message: " - Nome já cadastrado"

  validate :validates_presence_of_more_than_one_restaurant

  has_and_belongs_to_many :restaurant
  has_one :recipe

  private
  def validates_presence_of_more_than_one_restaurant
    errors.add("restaurants",
      "deve haver ao menos um restaurante") if restaurants.empty?
  end
end
