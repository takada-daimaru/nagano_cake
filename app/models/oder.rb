class Oder < ApplicationRecord
  has_many :order_items
  belongs_to :customers
end
