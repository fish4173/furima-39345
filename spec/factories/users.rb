FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { ('0'..'9').to_a.sample + Faker::Internet.password(min_length: 5, max_length: 5) }
    password_confirmation { password }
    first_name            { Faker::Japanese::Name.first_name }
    last_name             { Faker::Japanese::Name.last_name }
    first_name_kana       { Faker::Japanese::Name.first_name.yomi }
    last_name_kana        { Faker::Japanese::Name.last_name.yomi }
    birthday { Faker::Date.birthday }
  end
end
