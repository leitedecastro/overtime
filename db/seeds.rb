@user = User.create(
  email: "test@example.com",
  password: "asdfasdf", password_confirmation: "asdfasdf",
  first_name: "Paulo", last_name: "Castro"
)

puts "1 user created"

100.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} rationale content",
    user_id: @user.id
  )
end

puts "100 Post have been created"
