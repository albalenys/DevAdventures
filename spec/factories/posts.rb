FactoryGirl.define do
  factory :post do
    title Faker::Commerce.product_name
    content Faker::Hacker.say_something_smart
    admin
  end
end
