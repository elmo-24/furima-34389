class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :set_redirect
  def index
    @order_ship = OrderShip.new
  end

  def create
    @order_ship = OrderShip.new(order_params)
    if @order_ship.valid?
      pay_item
      @order_ship.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def order_params
    params.require(:order_ship).permit(:postal_code, :prefecture_id, :city, :shipping_address, :phone_number, :building_name).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end

  def set_redirect
    @item = Item.find(params[:item_id])
    if current_user == @item.user && @item.order.blank?
      redirect_to root_path
    end
  end
 end
