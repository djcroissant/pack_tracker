FactoryGirl.define do
  factory :expedition do
    title "Expedition Title"
    description " Description"
    sequence(:days) { |n| n }
    start_date Date.today
  end
end
