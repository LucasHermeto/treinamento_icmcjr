#encoding: utf-8
class Restaurant < ActiveRecord::Base

  validates_presence_of :name, message: "Deve ser preenchido"
  validates_presence_of :address, message: "Deve ser preenchido"
  validates_presence_of :specialty, message: "Deve ser preenchido"

  validates_uniqueness_of :name, message: "Nome já cadastrado"
  validates_uniqueness_of :address, message: "Endereço já cadastrado"

  validate :first_letter_uppercase

  private
  def first_letter_uppercase
    errors.add(:name,
     "Primeira letra deve ser maiúscula") unless name =~ /[A-Z].*/
  end
  has_many :qualifications
  has_and_belongs_to_many :dishes
end
