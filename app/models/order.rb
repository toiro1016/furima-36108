class Order < ApplicationRecord
  belongs_to :user
  has_one    :shipping
  belongs_to :item
  has_one_attached :image
end
