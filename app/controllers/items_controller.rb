class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :item_verification, only: [:edit, :update, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :status_id, :shipping_fee_id, :shipping_address_id,
                                 :delivery_day_id, :price, :image, :user_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_verification
    redirect_to root_path if current_user.id != @item.user_id || @item.order.present?
  end
end
