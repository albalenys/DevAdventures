# frozen_string_literal: true

FactoryBot.define do
  factory :project do
    title { Faker::Book.title }
    url { Faker::Internet.url }
    description { Faker::Lorem.paragraph_by_chars(200) }
    admin
  end
end