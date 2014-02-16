Rails.application.config.middleware.use OmniAuth::Builder do

   provider :twitter, ENV["TWITTER_KEY"], ENV["TWITTER_SECRET"]
   provider :instagram, ENV['INSTAGRAM_ID'], ENV['INSTAGRAM_SECRET']
   provider :evernote, ENV['EVERNOTE_KEY'], ENV['EVERNOTE_SECRET'], :client_options => { :site => 'https://sandbox.evernote.com' }
   provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], {:scope => "publish_actions, publish_stream"}

end