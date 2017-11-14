@user = User.create(
  email: "test@example.com",
  password: "asdfasdf", password_confirmation: "asdfasdf",
  first_name: "Paulo", last_name: "Castro",
  phone: "1234567890"
)

puts "1 User created"

AdminUser.create(
  email: "admin@example.com",
  password: "asdfasdf", password_confirmation: "asdfasdf",
  first_name: "Admin", last_name: "User",
  phone: "1234567890"
)

puts "1 AdminUser created"

100.times do |post|
  Post.create!(
    date: Date.today,
    rationale: "#{post} rationale content Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus scelerisque commodo rhoncus. Aliquam semper cursus gravida. Curabitur dictum dui a bibendum pretium. Sed magna urna, tempor in mauris facilisis, venenatis blandit velit. Nullam accumsan libero vel vulputate aliquam. Suspendisse potenti. Ut ut faucibus ipsum, eu ultricies nunc. Cras eu blandit.",
    user_id: @user.id,
    overtime_request: 2.5
  )
end

puts "100 Posts have been created"

AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 6.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 13.days))
AuditLog.create!(user_id: @user.id, status: 0, start_date: (Date.today - 20.days))

puts "3 AuditLogs have been created"
