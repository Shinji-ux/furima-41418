class ItemsController < ApplicationController
  before_action :move_to_login, only: :new

  def index
    @items = Item.includes(:user).order('created_at ASC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explain, :category_id, :condition_id, :shipping_fee_id, :shipping_area_id,
                                 :shipping_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_login
    return if user_signed_in?

    redirect_to new_user_session_path
  end
end
