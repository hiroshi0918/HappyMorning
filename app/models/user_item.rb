class UserItem < ApplicationRecord
  belongs_to :food
  belongs_to :user

  validates :quantity, numericality: { greater_than: 0 }
end
