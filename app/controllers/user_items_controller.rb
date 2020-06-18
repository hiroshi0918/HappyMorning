class UserItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_user_item!, only: [:create, :update, :destroy]
  require 'payjp'

  def index
    @user_items = current_user.user_items.includes(:food)
    @order_item = OrderItem.new
    @amount = sum_price

    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end



  def create
    if @user_item.blank?
      @user_item = current_user.user_items.build(food_id: params[:food_id])
      @user_item.quantity = 0
    end
      @user_item.quantity += params[:quantity].to_i

    if @user_item.save
      respond_to do |format|
        format.html { render("foods/index")}
        format.json
      end
    else
      redirect_to shop_foods_path(params[:shop_id])
    end
  end

  def update
    user_item = UserItem.find(params[:id])
    user_item.update(quantity: params[:quantity].to_i)
    redirect_back(fallback_location: user_user_items_path)
  end

  def destroy
    user_item = UserItem.find(params[:id])
    user_item.destroy
    redirect_back(fallback_location: user_user_items_path)
  end

  private

  def setup_user_item!
    if user_signed_in?
      @user_item = current_user.user_items.find_by(food_id: params[:food_id])
    else
      redirect_to new_user_session_path
    end
  end

  def sum_price
    sum = 0
    total = 0
    @user_items.each do |item|
      sum = item.food.price * item.quantity
      total += sum
    end
    return total
  end

end
