class UserItem < ApplicationRecord
  belongs_to :food, optional: true
  belongs_to :user, optional: true

  validates :quantity, numericality: { greater_than: 0 }
end
