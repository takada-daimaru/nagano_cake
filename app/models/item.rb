class Item < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :types

  enum status: { 販売中: 0, 売切れ: 1 }
end
