Factory.define :user do |user|
  user.email                     "mwhuss@gmail.com"
  user.password                  "password"
  user.password_confirmation     "password"

  user.apps                     { |apps| [apps.association(:app)] }
end


# #<User id: 1, email: "mwhuss@gmail.com", 
# crypted_password: "7d99695a0189319dd4caee91aef44d70e516f7d06cb9ad17e61...", 
# password_salt: "KEy37vAKLIRZm3YDFzaO", 
# persistence_token: "6ccdfc61552397bf0ed1ebbac7bfe8058d990c8684aeab7e9d9...", 
# login_count: 8, failed_login_count: 0, created_at: "2010-02-19 20:25:39", updated_at: "2010-02-24 16:36:46", admin: true, perishable_token: "JHXOTZglOxdkEvBC4hjK", single_access_token: "dtAVqOC3INnhvPTSU7xH">
