namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they have overtime or not"
  task sms: :environment do
    # Schedule to run at Sunday 5pm
    # Iterate over all employees
    # Skips admin users
    # Send a message that has instructions and a link to log time
    # User.all.each do |user|
    #   SmsTool.send_sms()
    # end
  end

  desc "Sends mail notifications to managers each day to inform of pending overtime requests"
  task manager_email: :environment do
    # Iterate over the list of pending overtime requests
    # Check to see if there are any requests
    # Iterate over the list of admin users/managers
    # send the email to the managers
    submitted_posts = Post.submitted
    admin_users = AdminUser.all

    if submitted_posts.count > 0
      admin_users.each do |admin|
        ManagerMailer.email(admin).deliver_now
      end
    end
  end
end
