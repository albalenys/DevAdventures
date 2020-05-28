# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    title { Faker::Book.title }
    content { Faker::Lorem.paragraph_by_chars(number: 3000) }
    private { Faker::Boolean.boolean }
    created_at { Faker::Date.between(from: 5.months.ago, to: Date.today) }
    admin
  end
end
