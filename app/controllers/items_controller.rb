# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_item, only: [:show, :destroy, :edit, :update]
  before_action :move_index, only: [:edit, :destroy]
  before_action :go_top, only: [:destroy, :edit, :update]

  def index
    @items = Item.order('created_at DESC')
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

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
   
  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end  
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :category_id, :status_id, :delivery_charge_id,
                                 :prefecture_id, :necessary_time_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_index
    if @item.user != current_user
      redirect_to root_path
    end
  end

  def go_top
    if @item.order.present?
      redirect_to root_path
    end
  end
  

end
