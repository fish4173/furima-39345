FactoryBot.define do
  factory :purchase_address do
    postal_code { '290-0051' }
    prefecture_id { 2 } # 適切な値に置き換えてください
    city { '市川市' }
    address_line1 { '3丁目' }
    phone_number { '09036887194' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
