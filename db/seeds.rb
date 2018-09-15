# frozen_string_literal: true

admin = Admin.create(username: 'Abby', password: 'password')

30.times do
  post = FactoryBot.create(:post)
  project = FactoryBot.create(:project)

  3.times do
    post.tags.find_or_create_by(name: Faker::Book.genre)
    post.resources.create(title: Faker::Book.title, url: Faker::Internet.url)
    project.tags.find_or_create_by(name: Faker::Book.genre)
  end
end
