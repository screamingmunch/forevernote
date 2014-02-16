class FacebookController < ApplicationController

  def get_fb
    fb_user = User.find_by_id(current_user)
    facebook_token = fb_user.linkedids.find_by_provider("facebook").token
    @graph = Koala::Facebook::API.new(facebook_token)
    @feed = @graph.get_connection('me','feed')

    @fb_messages = []
    @fb_pictures = []

    @feed.each do |post|
      if post['message']
        @fb_messages.push(post['message'])
      end

      if post['picture']
        @fb_pictures.push(post['picture'])
      end
    end

  end

end
