class AddTimeToOrderItem < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :order_date, :date, null: false
    add_column :order_items, :order_time_zone, :string, null: false 
  end
end
