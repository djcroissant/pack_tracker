FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
  end
end
