class Oder < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customers
end
