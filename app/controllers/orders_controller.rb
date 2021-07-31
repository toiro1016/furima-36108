class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item_id, only: [:index, :create]
  before_action :sold_out, only: [:index]

  def index
    @purchase = PurchaseInfomation.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    @purchase = PurchaseInfomation.new(purchase_params)
    if @purchase.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item[:price],
        card: purchase_params[:token],
        currency: 'jpy'
      )
      @purchase.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:purchase_infomation).permit(:postal_code, :prefecture_id, :municipality, :address, :building_name, :phone_number, :shipping_address_id).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end
end
