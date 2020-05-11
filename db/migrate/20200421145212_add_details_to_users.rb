class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :first_address, :string, null: false
    add_column :users, :second_address, :string, null: false
    add_column :users, :telephone, :string, null: false
  end
end
