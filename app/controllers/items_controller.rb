class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(create_params)
  end

  private
  def item_params
    params.require(:item).permit(:user_id, :item_name, :item_description, :category_id, :status_id, :delivery_charge_id, :prefecture_id, :necessary_time_id, :price)
  end
end
