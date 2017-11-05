@user = User.create(
  email: "test@example.com",
  password: "asdfasdf", password_confirmation: "asdfasdf",
  first_name: "Paulo", last_name: "Castro",
  phone: "5555555"
)

puts "1 user created"

AdminUser.create(
  email: "admin@example.com",
  password: "asdfasdf", password_confirmation: "asdfasdf",
  first_name: "Admin", last_name: "User",
  phone: "5555555"
)

puts "1 admin user created"

100.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} rationale content",
    user_id: @user.id,
    overtime_request: 2.5
  )
end

puts "100 Post have been created"
