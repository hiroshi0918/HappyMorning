FactoryBot.define do
  factory :food do
    sequence(:name, "TEST_NAME_1")
    sequence(:price, 200)
    sequence(:image, "abcdefghijklmn_1")
    sequence(:category_id, 1)
    sequence(:shop_id, 1)

  end
end