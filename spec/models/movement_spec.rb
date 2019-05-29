require 'rails_helper'

RSpec.describe Movement, type: :model do

  let(:type_transaction_positive) { FactoryBot.create(:type_transaction_positive) }
  let(:recipient) { FactoryBot.create(:recipient) }
  let(:store)  { FactoryBot.create(:store)  }
  let(:import_info) { "CNAB.txt_#{DateTime.now.to_s}"}

  it "is not valid without a type_transaction" do
    moviment = Movement.new({
      recipient: recipient,
      store: store,
      import_info: import_info
    })
    expect(moviment).to be_invalid
  end

  it "is not valid without a recipient" do
    moviment = Movement.new({
      type_transaction: type_transaction_positive,
      store: store,
      import_info: import_info
    })
    expect(moviment).to be_invalid
  end

  it "is not valid without a store" do
    moviment = Movement.new({
      type_transaction: type_transaction_positive,
      recipient: recipient,
      import_info: import_info
    })
    expect(moviment).to be_invalid
  end

  it "is not valid without a import_info" do
    moviment = Movement.new({
      type_transaction: type_transaction_positive,
      recipient: recipient,
      store: store
    })
    expect(moviment).to be_invalid
  end


end
