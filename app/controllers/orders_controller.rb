class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_prototype, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index]

  def index
    @shipping_address = PurchaseAddress.new
  end

  # def new
  #   @shipping_address = ShippingAddress.new
  # end

  def create
    @shipping_address = PurchaseAddress.new(purchase_params)
    if @shipping_address.valid?
      @shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:postal_code, :city, :address_line1, :address_line2,:prefecture_id, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])

  end

  def set_prototype
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user && @item.purchase.present?

# 購入テーブルに情報があるか？@item.purchase.present?
# カレンとユーザーが出した商品化どうか？
# ログイン状態であるか？

  end


end
