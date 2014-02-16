class LinkedId < ActiveRecord::Base
  attr_accessible :user_id, :name, :provider, :uid

  belongs_to :user
end
