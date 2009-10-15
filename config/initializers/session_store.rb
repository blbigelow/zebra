# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_zebra2_session',
  :secret      => 'ca60aa16ae98fb7cf931f7434770a7610522963d7e45d8076cac50202816589cbfa5b9092a10b04cbf431b133856879d8e3cb369522b75363c132f75f2bf63db'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
