class HomeController < ApplicationController
  def index
  end

  def show
    @journals = Jounral.where(user_id:current_user.id)
  end
end
