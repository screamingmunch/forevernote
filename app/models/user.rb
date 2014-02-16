class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name

  has_many :linkedids

  validates :provider, presence: true
  validates :uid, presence: true
  validates :name, presence: true

  def self.create_with_omniauth(auth)
    create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
    end
  end
end