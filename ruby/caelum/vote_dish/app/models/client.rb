class Client < ActiveRecord::Base
  validates_presence_of :name, message: " - Deve ser Preenchido"
  validates_uniqueness_of :name, message: " - Nome já cadastrado"

  validates_numericality_of :age, greater_than: 0,
                                  less_than: 100,
                                  message: " - Deve ser um número entre 0 e 100"
  has_many :qualifications
end
