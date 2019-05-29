class Movement < ApplicationRecord

  belongs_to :type_transaction
  belongs_to :recipient
  belongs_to :store

  validates :type_transaction, :recipient, :store, :import_info, presence: true

end
