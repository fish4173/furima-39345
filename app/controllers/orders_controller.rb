class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_prototype, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index]

  def index
    @shipping_address = PurchaseAddress.new
  end

  def create
    @shipping_address = PurchaseAddress.new(purchase_params)
    if @shipping_address.valid?
      pay_item

      @shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :city, :address_line1, :address_line2, :prefecture_id, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_prototype
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    # redirect_to root_path if (current_user == @item.user && @item.purchase.present?) or (current_user != @item.user && @item.purchase.present?)
    redirect_to root_path if @item.purchase.present? || current_user == @item.user
    # 購入テーブルに情報があるか？@item.purchase.present?
    # カレンとユーザーが出した商品化どうか？
    # ログイン状態であるか？
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      # amount: purchase_params[:price],  # 商品の値段
      amount: @item.price, # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
