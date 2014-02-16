# # Load libraries required by the Evernote OAuth
# require 'oauth'
# require 'oauth/consumer'

# # Load Thrift & Evernote Ruby libraries
# require "evernote_oauth"

# # Client credentials
# OAUTH_CONSUMER_KEY = ENV['EVERNOTE_KEY']
# OAUTH_CONSUMER_SECRET = ENV['EVERNOTE_SECRET']

# # Connect to Sandbox server?
# SANDBOX = false


# developer_token = "S=s1:U=8df6c:E=14b8f4cace7:C=144379b80e9:P=1cd:A=en-devtoken:V=2:H=81f0ba7ca9e583948c75da1078ceba40";

# # Set up the NoteStore client
# client = EvernoteOAuth::Client.new(
#   token: 'S=s1:U=8df6c:E=14b8f4cace7:C=144379b80e9:P=1cd:A=en-devtoken:V=2:H=81f0ba7ca9e583948c75da1078ceba40',
#   # additional_headers: my_user_agent
# )
# note_store = client.note_store

# # Make API calls
# notebooks = note_store.listNotebooks
# notebooks.each do |notebook|
#   puts "Notebook: #{notebook.name}";
# end