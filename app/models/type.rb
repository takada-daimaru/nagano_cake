class Type < ApplicationRecord
  has_many :order, dependent: :destroy
end
