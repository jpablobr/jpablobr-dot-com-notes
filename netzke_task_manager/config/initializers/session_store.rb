# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_netzke_task_manager_session',
  :secret      => 'ebc318ab694311b9d64dd756c71d525d8f49a376406c4591ab043551cd8575bcc1a41512114d0d47f7d9b326ba21d0528df2cec07936064567fa112781f2e6ef'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
