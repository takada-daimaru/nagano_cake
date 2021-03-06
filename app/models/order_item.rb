class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  enum status: { 着手不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }


  def set_default_values
    self.status       ||= 0
  end

  def sum_items_count
    sum = 0
    order_items.each do |i|
      sum += i.count
    end
    sum
  end

  def sum_items_price
    sum = 0
    order_items.each do |i|
      sum += i.price
    end
    sum
  end

end
