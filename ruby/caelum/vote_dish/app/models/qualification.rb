class Qualification < ActiveRecord::Base
  validates_presence_of :remark, message: " - deve ser preenchido"
  validates_presence_of :spend, message: " - deve ser preenchido"

  validates_presence_of :client_id, :restaurant_id
  validates_associated :client, :restaurant

  validates_numericality_of :remark, greater_than_or_equal_to: 0,
    less_than_or_equal_to: 10,
    message: " - deve ser um número entre 0 e 10"
  validates_numericality_of :spend, greater_than: 0,
    message: " - deve ser um número maior que 0"

  belongs_to :client
  belongs_to :restaurant
end
