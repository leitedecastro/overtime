namespace :notification do
  desc "Sends SMS notification to employees asking them to log if they have overtime or not"
  task sms: :environment do
    # Schedule to run at Sunday 5pm
    # Iterate over all employees
    # Skips admin users
    # Send a message that has instructions and a link to log time

    User.all.each do |user|
      SmsTool.send_sms()
    end

  end

end
