class Item < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  belongs_to :type, optional: true
  attachment :image

  enum status: { ケーキ: 0, クッキー: 1,チョコレート: 2, プリンorゼリー: 3, 和菓子: 4,　アイス: 5}
  enum status: { 販売中: 0, 売切れ: 1 }
end
