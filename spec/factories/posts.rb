# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph_by_chars(3000) }
    private { Faker::Boolean.boolean }
    created_at { Faker::Date.between(5.months.ago, Date.today) }
    admin
  end
end
