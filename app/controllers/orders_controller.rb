class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new
  end
 
  def new
    @address_order = AddressOrder.new   
  end
 
  def create
    @item = Item.find(params[:item_id])
    @address_order = AddressOrder.new(order_params) 
     if @address_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],    
        currency: 'jpy'                 
      )
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
end
