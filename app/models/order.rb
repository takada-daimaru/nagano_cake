class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customer

  enum payment: { 銀行振込: 0, クレジット: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

  validates :address, presence: true
  validates :postcode, presence: true
  validates :destination, presence: true

end
