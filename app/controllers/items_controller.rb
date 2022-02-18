class ItemsController < ApplicationController
  def index; end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :delivery_charge_id,
                                 :prefecture_id, :necessary_time_id, :price, :image).merge(user_id: current_user.id)
  end
end
