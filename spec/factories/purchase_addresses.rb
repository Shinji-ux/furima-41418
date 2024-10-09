FactoryBot.define do
  factory :purchase_address do
    token {"tok_abcdefghijk00000000000000000"}
    postal_code { "001-0011" }
    shipping_area_id { 2 }
    municipality { Faker::Lorem.sentence }
    street_address { Faker::Lorem.sentence }
    building { Faker::Lorem.sentence }
    telephone_number { Faker::Number.number(digits: 11) }
  end
end
