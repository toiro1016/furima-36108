FactoryBot.define do
  factory :purchase_infomation do
    postal_code { '123-4567' }
    shipping_address_id { 2 }
    municipality { '横浜市港南区' }
    address { '桂町1-1' }
    building_name { 'ゴールドビル２−２' }
    phone_number { '08012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
