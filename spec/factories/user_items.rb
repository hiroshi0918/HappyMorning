FactoryBot.define do
  factory :user_item do
    sequence(:quantity, 1)
    sequence(:food_id, 1)
    sequence(:user_id, 1)
  end
end