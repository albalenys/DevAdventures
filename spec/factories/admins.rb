FactoryGirl.define do
  factory :admin do
    username Faker::Internet.user_name
    password "password"
    password_confirmation "password"
  end
end
