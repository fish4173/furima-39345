FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/無題.jpg'), filename: 'test_image.png')
    end

    item_name { Faker::Lorem.word }
    item_description { Faker::Lorem.paragraph }
    category_id { 2 } # 適切な値に置き換えてください
    condition_id { 2 } # 適切な値に置き換えてください
    shipping_fee_id { 2 } # 適切な値に置き換えてください
    prefecture_id { 2 } # 適切な値に置き換えてください
    shipping_duration_id { 2 } # 適切な値に置き換えてください
    price { 1000 } # 適切な値に置き換えてください
  end
end
