class User < ActiveRecord::Base
  has_many :illnesses
  has_many :answers

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(name: auth["info"]["name"])
    user.save
    user
  end

  def self.create_guest
    user = User.create(name: "Guest")
  end

end
