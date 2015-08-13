require 'securerandom'

class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email

  def self.from_twitter(auth)
    create! do |user|
      user.name = auth.info.nickname
      user.uid = auth.uid
      user.twitter_token = auth.credentials.token
      user.twitter_secret = auth.credentials.secret 
      user.password = SecureRandom.hex
    end
  end
end
