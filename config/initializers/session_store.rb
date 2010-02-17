# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_appmarkit_session',
  :secret      => '26fb8bbc46ce6e1ff5813a3a10038ed903484026c9e96e5f26c7aecf7ca229ae4323655614786ec617a8aedf0593a3e4745541483783bccd9d511a471b7566e1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
