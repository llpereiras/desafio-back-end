FactoryBot.define do
  factory :recipient, class: Recipient do
    sequence(:name)  { |n| "#{Faker::Lorem.words(3).join(' ')} #{n}" }
    sequence(:cpf)  { |n| Faker::CPF.numeric }
  end

end
