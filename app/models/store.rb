class Store < ApplicationRecord

  has_many :movements

  validates :name, :owner, presence: true

end
