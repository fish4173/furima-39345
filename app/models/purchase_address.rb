class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id,:city,:address_line1,:address_line2,:phone_number,:purchase,:user_id,:item_id


  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/}
    validates :city
    validates :address_line1
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id

  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
  # 各テーブルにデータを保存する処理を書く

  # 購入有無の情報を保存し、変数purchase_addressに代入する
  purchase = Purchase.create(user_id: user_id,item_id:item_id)
  # 住所を保存する
  ShippingAddress.create(postal_code: postal_code, city: city, address_line1: address_line1, address_line2: address_line2, phone_number: phone_number,prefecture_id:prefecture_id,purchase_id:purchase.id)

  end
end
