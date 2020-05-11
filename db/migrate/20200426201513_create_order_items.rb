class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.references :user, foreign_key: true
      t.references :food, foreign_key: true
      t.integer :order_number
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
