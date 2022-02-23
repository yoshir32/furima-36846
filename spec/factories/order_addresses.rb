FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Name }
    street_number { Faker::Number }
    building { Faker::Number }
    telephone { 12345678910 }
  end
end
