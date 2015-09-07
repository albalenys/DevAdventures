FactoryGirl.define do
  factory :project do
    title Faker::Commerce.product_name
    url Faker::Internet.url
    admin
  end
end
