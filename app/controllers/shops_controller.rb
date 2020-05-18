class ShopsController < ApplicationController

  def index
    @shops = Shop.page(params[:page]).per(6)
    @user_items_amount = current_user.user_items.sum(:quantity)if user_signed_in?
  end

end
