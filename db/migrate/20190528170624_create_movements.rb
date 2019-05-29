class CreateMovements < ActiveRecord::Migration[5.2]
  def change
    create_table :movements do |t|
      t.belongs_to :type_transaction, foreign_key: true
      t.belongs_to :recipient, foreign_key: true
      t.belongs_to :store, foreign_key: true
      t.datetime :datetime
      t.decimal :amount, precision: 8, scale: 2
      t.string :card
      t.string :import_info

      t.timestamps
    end
  end
end
