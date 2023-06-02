require 'rails_helper'

RSpec.describe Item, type: :model do
  before do # 先にデータを入れる。 factoriesのusers.rbを参照する。
    @item = FactoryBot.build(:item)
  end

  describe '商品新規登録' do
    context '新規登録できるとき' do
      it 'imageとitem_nameとitem_descriptionとcategory_idとcondition_idとshipping_fee_idとprefecture_idとshipping_duration_idとpriceがあれば登録できる。' do
        expect(@item).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空では登録できない' do
        @item.condition_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'shipping_fee_idが空では登録できない' do
        @item.shipping_fee_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_duration_idが空では登録できない' do
        @item.shipping_duration_id = '---'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping duration can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが整数でないと登録できない' do
        @item.price = '777.7'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'priceが大文字では登録できない' do
        @item.price = '777.7'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'priceが299以下だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'priceが10000000以上だと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
