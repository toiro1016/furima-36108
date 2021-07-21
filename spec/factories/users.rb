FactoryBot.define do
  factory :user do
    nickname { 'test' }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '井上' }
    last_name { '峻' }
    kana_first_name { 'イノウエ' }
    kana_last_name { 'シュン' }
    birthday { '1984-10-16' }
  end
end
