class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :text, :category_id, :cost_id, :days_id, :prefecture_id, :status_id).merge(user_id: current_user.id)
  end
end
