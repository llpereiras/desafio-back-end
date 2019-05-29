require 'rails_helper'

RSpec.describe RecipientService  do

  let(:recipient) { Faker::CPF.numeric }

  it 'Return a Recipient instance' do
    expect(RecipientService.save(recipient)).to be_a Recipient
  end

end
