class OrderItem < ApplicationRecord
  belongs_to :order

  enum status: { 着手不可: 0, 製作待ち: 1, 試作中: 2, 製作完了: 3 }
end
