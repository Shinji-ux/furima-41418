class ItemsController < ApplicationController
  before_action :move_to_login, only: [:new, :edit, :destroy]
  before_action :correct_user, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update]

  def index
    @items = Item.includes(:user, :purchase_record).order('created_at DESC')
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

  def show
  end

  def edit
    if @item.purchase_record
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
      @item.destroy
      redirect_to root_path
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

  def correct_user
    @item = Item.find(params[:id])
    return if @item.user == current_user

    redirect_to root_path
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
