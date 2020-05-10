class OrderItemsController < ApplicationController

  def index
    @order_items = OrderItem.order(created_at: :desc).group(:created_at).count.keys
      
  end


  def create
    @total_price = 0
    order_item_params.keys.each do |id|
      item = OrderItem.new(order_item_params[id])
      item.user_id = current_user.id
      item.order_date = Time.zone.local(params[:order_item]["order_date(1i)"].to_i, params[:order_item]["order_date(2i)"].to_i, params[:order_item]["order_date(3i)"].to_i)
      item.order_time_zone = params[:order_item][:order_time_zone]
      @total_price += item.price * item.quantity
      item.save
    end
    pay
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
      amount: @total_price, # 決済する値段
      customer: card.customer_id, # フォームを送信すると生成されるトークン
      currency: 'jpy'
    )
    current_user.user_items.delete_all
    redirect_to action: 'done'
  end

  def done
    @user_items = current_user.user_items
  end

  private
  def order_item_params
    params.permit(order_items: [:quantity, :price, :food_id])[:order_items]
  end

  def sum_price(order)
    amount = 0
    item = OrderItem.where(created_at: order).to_a
    amount += item[0].quantity * item[0].food.price
  end

end
