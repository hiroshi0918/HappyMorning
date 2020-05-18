class FoodsController < ApplicationController
  def index
    @foods = Food.where(shop_id: params[:shop_id]).page(params[:page]).per(8)
    @shop = Shop.find(params[:shop_id])
    @user_items_amount = current_user.user_items.sum(:quantity)if user_signed_in?
  end

  def show
  end

end
