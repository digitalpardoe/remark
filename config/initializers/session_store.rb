# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key    => '_remark_session',
  :secret => '7b9e4c1c1fe50d1c10cd4e6a82e19cf1182f5f4669910c42a3dada2b3836a6c1586e72702e69eb267e0f9f1922cac483661fa2d60b2f5388929ca6d2f2bd5b6a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
