# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.

#SampleApp::Application.config.secret_key_base = '4be5d10c334118c40deeaddfa3249fed74da0bbf1342cc28b9a5e296763e863b985066e7f5498cceef5cb273160f637f1ed90252c1d828a34135c6ece5009b4f'

require 'securerandom'

def secure_token
   token_file = Rails.root.join('.secret')
   if File.exists?(token_file)
      # Use the existing token
      File.read(token_file).chomp
   else
      # Generate a new token and store it in token_file
      token = SecureRandom.hex(64)
      File.write(token_file, token)
      token
   end
end

SampleApp::Application.config.secret_key_base = secure_token
