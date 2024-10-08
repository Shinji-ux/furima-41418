class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @item = Item.find(params[:id])
    @purchase_address = PurchaseAddress.new
    if @item.purchase_record || @item.user == current_user
      redirect_to root_path
    end
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def purchase_record_params
    @item = Item.find(params[:id])
    params.require(:purchase_address).permit(:postal_code, :shipping_area_id, :municipality, :street_address, :building, :telephone_number).merge(user_id: current_user.id, item_id: @item.id, )
  end

end
