require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do # 先にデータを入れる。 factoriesのusers.rbを参照する。
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address,user_id: user.id,item_id:item.id)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do

      it 'postal_codeとprefecture_idとcityとaddress_line1 とaddress_line2 とphone_numberとprefecture_idとshipping_duration_idとpriceがあれば登録できる。' do
        expect(@purchase_address).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'postal_codeが空では登録できない' do
        @purchase_address.postal_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeは3桁-4桁でないと登録できない' do
        @purchase_address.postal_code = '2890000'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空では登録できない' do
        @purchase_address.prefecture_id = '1'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では登録できない' do
        @purchase_address.city = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end
      it 'address_line1が空では登録できない' do
        @purchase_address.address_line1 = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address line1 can't be blank")
      end

      it 'phone_numberが空では登録できない' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberが10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @purchase_address.phone_number = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end
  end
