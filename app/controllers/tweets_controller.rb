class TweetsController < ApplicationController

# @twitter_token = Linkedid.find_by_provider("twitter").token
# @twitter_secret = Linkedid.find_by_provider("twitter").secret

def client
  twitter_user = User.find_by_id(current_user)
  twitter_token = twitter_user.linkedids.find_by_provider('twitter').token
  twitter_secret = twitter_user.linkedids.find_by_provider('twitter').secret

  @client = Twitter::Client.new(
        :consumer_key => "#{ENV["TWITTER_KEY"]}",
        :consumer_secret => "#{ENV["TWITTER_SECRET"]}",
        :oauth_token => twitter_token,
        :oauth_token_secret => twitter_secret)

end

def get_all_tweets
  @tweets = client.user_timeline

    @mapped_tweets = @tweets.map do|tweet|
      {
        :text=> tweet[:text]
      }
    end

end


end
