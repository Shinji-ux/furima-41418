FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.sentence }
    explain { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    shipping_area_id { 2 }
    shipping_day_id { 2 }
    price { 500 }
    association :user
    

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
