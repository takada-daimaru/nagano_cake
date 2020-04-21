class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item

  validates :quontity, numericality: {only_integer: true,greater_than_or_equal_to: 0 }
end
