class OrdersController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!
  before_action :move_top
 
  def index
    @order_address = OrderAddress.new
  end


  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipality, :street_number, :building, :telephone)
    .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def move_top
    if current_user == @item.user
      redirect_to root_path
    else
      @order_address.presence
      redirect_to root_path
    end
  end

end
