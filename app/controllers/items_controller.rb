class ItemsController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def new
    @itme = Iteme.new
  end

  def create
    @itmes = Iteme.new(itme_params)
    if @itme.valid?
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def itme_params
    params.require(:itme).permit(:title,:image,:text,:category_id,:cost_id,:days_id,:prefecture_id,:status).merge(user_id: current_user.id)
  end
end
