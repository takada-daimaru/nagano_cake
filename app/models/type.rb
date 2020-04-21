class Type < ApplicationRecord
  has_many :items, dependent: :destroy

  enum status: { 無効: true, 有効: false }
end
