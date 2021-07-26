class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :shipping_address
  belongs_to :shipping_fee
  belongs_to :status

  has_one_attached :image
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :description
    validates :price
    validates :image
  end
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :shipping_address_id
    validates :delivery_day_id
  end
  validates :price, format: { with: /\A[0-9]+\z/ }
  validates_inclusion_of :price, in: 300..9_999_999
end
