Factory.define :user do |user|
  user.email                     "mwhuss@gmail.com"
  user.crypted_password          "7d99695a0189319dd4caee91aef44d70e516f7d06cb9ad17e61374701d9a77bc4ab0ef177ba7318045752c5b9c18f88416b5c5e364f516b2b8ee7a96698f291c"
  user.password_salt             "KEy37vAKLIRZm3YDFzaO"
    
  user.apps                     { |apps| [apps.association(:app)] }
end


# #<User id: 1, email: "mwhuss@gmail.com", 
# crypted_password: "7d99695a0189319dd4caee91aef44d70e516f7d06cb9ad17e61...", 
# password_salt: "KEy37vAKLIRZm3YDFzaO", 
# persistence_token: "6ccdfc61552397bf0ed1ebbac7bfe8058d990c8684aeab7e9d9...", 
# login_count: 8, failed_login_count: 0, created_at: "2010-02-19 20:25:39", updated_at: "2010-02-24 16:36:46", admin: true, perishable_token: "JHXOTZglOxdkEvBC4hjK", single_access_token: "dtAVqOC3INnhvPTSU7xH">
