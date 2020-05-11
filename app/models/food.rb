class Food < ApplicationRecord
  belongs_to :category
  has_many :user_items, dependent: :destroy
  has_many :users, through: :user_items
  has_many :order_items, dependent: :nullify
  belongs_to :shop
end
