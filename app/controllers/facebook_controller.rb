class FacebookController < ApplicationController

  def get_fb
    fb_user = User.find_by_id(current_user)
    facebook_token = fb_user.linkedids.find_by_provider("facebook").token
    @graph = Koala::Facebook::API.new(facebook_token)
    @feed = @graph.get_connection('me','feed')

    @fb_messages = []
    @feed.each do |message|
      if message['message']
        @fb_messages.push(message['message'])
      end
    end
  end

end
