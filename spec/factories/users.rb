FactoryBot.define do
  factory :user do
    sequence(:first_name, "TEST_FIRST_NAME_1")
    sequence(:last_name,"TEST_LAST_NAME_1")
    sequence(:first_address,"TEST_FIRST_ADDRESS_1")
    sequence(:second_address,"TEST_SECOND_ADDRESS_1")
    sequence(:telephone,"080-1111_1")
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:password) { |n| "123456#{n}"}
    uid {""}
    username {""}
    provider {""}
    admin {false}
  end
end