class UserItem < ApplicationRecord
  belongs_to :food, optional: true
  belongs_to :user, optional: true
end
