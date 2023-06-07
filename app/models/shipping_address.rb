class ShippingAddress < ApplicationRecord
  belongs_to:purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  # 空の投稿を保存できないようにする
  # validates :postal_code, presence: true
  # validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  # validates :city, presence: true
  # validates :address_line1, presence: true
  # validates :phone_number, presence: true

end
