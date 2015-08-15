FactoryGirl.define do

  # inventory item factory with a `belongs_to` association for the user
  factory :inventory_item do
    title "Item Title"
    description "Item Description"
    sequence(:weight) { |n| n }
    user
    expeditions {[FactoryGirl.create(:expedition)]}
  end

  factory :expedition do
    title "Expedition Title"
    sequence(:days) { |n| n }
    start_date Date.today
  end

  # user factory without associated inventory items
  factory :user do
    sequence(:name) { |n| "user#{n}" }
    sequence(:email) { |n| "test#{n}@example.com" }
    password "Password"

    # user_with_items will create inventory item data after the user has been created
    factory :user_with_items do
      expeditions {[FactoryGirl.create(:expedition)]}

      # inventory items_count is declared as a transient attribute and available in
      # attributes on the factory, as well as the callback via the evaluator
      transient do
        inventory_items_count 5
      end

      # the after(:create) yields two values; the user instance itself and the
      # evaluator, which stores all values from the factory, including transient
      # attributes; `create_list`'s second argument is the number of records
      # to create and we make sure the user is associated properly to the inventory item
      after(:create) do |user, evaluator|
        create_list(:inventory_item, evaluator.inventory_items_count, user: user)#, expedition: user.expeditions.first)
        user.expeditions.first.inventory_items << user.inventory_items
      end
    end
  end
end
