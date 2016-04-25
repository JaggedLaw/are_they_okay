class User < ActiveRecord::Base
  has_many :illnesses

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(name: auth["info"]["name"])
    user.save
    user
  end

end
