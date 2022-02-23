class OrdersController < ApplicationController
 
  def index
    
  end

  def new
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
 


    end
  end

  private
  
  def order_params
    params.permit(:item_id, :post_code, :prefecture_id, :municipality, :street_number, :building, :telephone).merge(user_id: current_user.id)
  end

end
