FactoryBot.define do
  factory :store, class: Store do
    sequence(:name)  { |n| "#{Faker::Lorem.words(3).join(' ')} #{n}" }
    sequence(:owner)  { |n| "#{Faker::Lorem.words(3).join(' ')} #{n}" }
  end

end
