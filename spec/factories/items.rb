FactoryBot.define do
  factory :item do
    association :user
    item_name             { Faker::Name }
    item_description      { Faker::Food }
    category_id           { Faker::Number.between(from: 2, to: 11) }
    status_id             { Faker::Number.between(from: 2, to: 3) }
    delivery_charge_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id         { Faker::Number.between(from: 2, to: 48) }
    necessary_time_id     { Faker::Number.between(from: 2, to: 4) }
    price                 { Faker::Number.between(from: 300, to: 9_999_999) }
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample_image.png'), filename: 'sample_image.png')
    end
  end
end
