FactoryBot.define do
  factory :item do
    name { 'test' }
    description { 'test' }
    category_id { '2' }
    status_id { '2' }
    shipping_fee_id { '2' }
    shipping_address_id { '2' }
    delivery_day_id { '2' }
    price { 400 }

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/flag.png'), filename: 'flag.png')
    end
  end
end
