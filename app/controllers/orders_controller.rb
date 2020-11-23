class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index

  def index
    @address_order = AddressOrder.new
  end
 
 
  def create
    @address_order = AddressOrder.new(order_params) 
     if @address_order.valid?
       pay_item
       @address_order.save
       redirect_to root_path
     else
       render action: :index
     end
  end


  private
  def order_params
    params.require(:address_order).permit(:postal_code, :phone_number, :prefecture_id, :city, :building_number,:building_name, :token).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token] )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to root_path
    end
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end


end
