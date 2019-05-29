class CreateTypeTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :type_transactions do |t|
      t.string :description
      t.string :nature
      t.string :sinal, :length => 1
      t.timestamps
    end
  end
end
