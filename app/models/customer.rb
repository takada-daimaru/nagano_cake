class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :first_name_kana, presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :last_name_kana,  presence: true, format: {with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :phone_number, presence: true, format: {with: /\A\d{10}$|^\d{11}\z/, message: '正しく電話番号を入力してください。'}
  validates :post_code,  presence: true, format: {with: /\A\d{7}\z/, message: '7桁の数字のみ入力ください。'}
  validates :address, presence: true

  has_many :shippings, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :cart_items, dependent: :destroy

  enum status: { 有効: 0, 退会済み: 1 }

  attr_accessor :current_password

end
