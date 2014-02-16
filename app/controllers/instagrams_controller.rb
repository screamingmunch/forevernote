class InstagramsController < ApplicationController

  # def client
  #   instagram_user = User.find_by_id(current_user)
  #   instagram_token = instagram_user.linkedids.find_by_provider('instagram').token

  #   Instagram.configure do |config|
  #     config.client_id = ENV['INSTAGRAM_ID']
  #     config.access_token = instagram_token
  #   end
  #    binding.pry
  # end

  def get_instagrams
    instagram_user = User.find_by_id(current_user)
    instagram_token = instagram_user.linkedids.find_by_provider('instagram').token
    instagram_user_id = instagram_user.linkedids.find_by_provider('instagram').uid

    Instagram.configure do |config|
      config.client_id = ENV['INSTAGRAM_ID']
      config.access_token = instagram_token
    end

    @photos = Instagram.user_recent_media(instagram_user_id.to_s)

    binding.pry

  end

end
