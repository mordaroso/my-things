# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_my-things_session',
  :secret      => '19eb1dab74418b7bbe0bd81f04ef88e2b459203b66aa449c732c047d86c4d43ad1fcd1f8bdea1ff08e4967d34f5f8c0984df29b23c46bd00feae54f9f1349d4a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
