FactoryBot.define do
  factory :type_transaction_positive, class: TypeTransaction do
    sequence(:description)  { |n| "#{Faker::Lorem.words(3).join(' ')} #{n}" }
    sequence(:nature)  { |n| "#{Faker::Lorem.words(3).join(' ')} #{n}" }
    sinal { "+" }
  end

  factory :type_transaction_negative, class: TypeTransaction do
    sequence(:description)  { |n| "#{Faker::Lorem.words(3).join(' ')} #{n}" }
    sequence(:nature)  { |n| "#{Faker::Lorem.words(3).join(' ')} #{n}" }
    sinal { "-" }
  end

end
