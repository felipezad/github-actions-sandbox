require 'slack-ruby-client'

puts 'Beginning'

# Set up a Slack API client with your bot token (token from mvp in private workspace)
Slack.configure do |config|
  config.token = ENV['API_KEY']
end
client = Slack::Web::Client.new

# Search for a user by email address
email = 'felipe.zadinello@sumup.com'
response = client.users_lookupByEmail(email: email)

# puts response
puts response.user.id

# Get the user ID of the user you want to send a message to
user_id = client.users_info(user: response.user.id).user.id

# # Send a message to the user
client.chat_postMessage(channel: user_id, text: 'Hello, World!')

puts 'End of Ruby script'
