class Jounral < ActiveRecord::Base
   attr_accessible :user_id, :name, :guid

   belongs_to :user
end
