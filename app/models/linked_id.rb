class LinkedId < ActiveRecord::Base
  attr_accessible :user_id, :name, :provider, :uid, :token, :secret

  belongs_to :user
end
