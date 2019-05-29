class Recipient < ApplicationRecord

  has_many :movements

  validates :cpf, presence: true

end
