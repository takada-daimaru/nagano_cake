class Oder < ApplicationRecord
  has_many :order_items, dependent: :destroy
  belongs_to :customers

  enum payment: { 銀行振込: 0, クレジットカード: 1　}
  enum status: { 入金確認: 0, 製作中: 1, 発送準備中: 2, 発送済み: 3 }
end
