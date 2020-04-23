class Item < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :type, optional: true
  attachment :image

  validates :name, presence: true
	validates :price, 		  presence: true
	validates :explanation, presence: true
	validates :status, presence: true

  enum status: { 販売中: 0, 売切れ: 1 }
end
