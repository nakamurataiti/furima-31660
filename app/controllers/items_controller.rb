class ItemsController < ApplicationController
  before_action :authenticate_user!,:move_to_index, except: [:index, :show]
  before_action :set_item, only: [:edit, :show, :update,]


  def index
    @items = Item.all
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end
  
  def show
  end

  def create
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
    def edit
    end

    def destroy
      item = Item.find(params[:id])
      item.destroy
      redirect_to root_path
    end

    def update
      if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
    end


  private

  def item_params
    params.require(:item).permit(:title, :price, :image, :text, :category_id, :cost_id, :days_id, :prefecture_id, :status_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end
end
