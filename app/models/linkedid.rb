class Linkedid < ActiveRecord::Base
   attr_accessible :provider, :name, :uid, :token, :secret, :user_id

   belongs_to :user
end
