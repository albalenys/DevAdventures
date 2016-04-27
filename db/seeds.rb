admin = Admin.create(username: "Abby", password: "password")

post = Post.create(admin: admin, title: "Test", content: "Testing")
private_post = Post.create(admin: admin, title: "Private Test", content: "Testing", private: true)

post.tags.find_or_create_by(name: "programming")
post.tags.find_or_create_by(name: "jobs")
post.tags.find_or_create_by(name: "google")