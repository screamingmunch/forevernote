class FacebookController < ApplicationController

  def get_fb
    fb_user = User.find_by_id(current_user)
    facebook_token = fb_user.linkedids.find_by_provider("facebook").token
    @graph = Koala::Facebook::API.new(facebook_token)
    binding.pry
  end

end
