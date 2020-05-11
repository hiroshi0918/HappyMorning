class AddAddressToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :first_address, :string
    add_column :order_items, :second_address, :string
  end
end
