class PurchaseInfomation
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_address_id, :municipality, :address, :building_name, :phone_number, :user_id, :token,
                :item_id

  with_options presence: true do
    validates :shipping_address_id
    validates :municipality
    validates :address
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
  end

  def save
    order = Order.create!(user_id: user_id, item_id: item_id)
    shipping = Shipping.create!(postal_code: postal_code, shipping_address_id: shipping_address_id, municipality: municipality,
                                address: address, building_name: building_name, phone_number: phone_number, order: order)
  end
end
