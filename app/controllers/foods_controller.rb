class FoodsController < ApplicationController
  def index
    @foods = Food.where(shop_id: params[:shop_id])
    @shop = Shop.find(params[:shop_id])
  end

  def show

  end
end
