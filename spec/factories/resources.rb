FactoryGirl.define do
  factory :resource do
    title Faker::Commerce.product_name
    url Faker::Internet.url
    post
  end

end
