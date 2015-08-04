FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password "Password"
  end
end
