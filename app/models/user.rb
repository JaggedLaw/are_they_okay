class User < ActiveRecord::Base
  has_many :illnesses
  has_many :answers
  has_many :user_roles
  has_many :roles, through: :user_roles

  def admin?
    roles.exists?(name:"admin")
  end

  def session_guest?
    roles.exists?(name:"session_guest")
  end

  def self.find_or_create_by_auth(auth)
    user = User.find_or_create_by(name: auth["info"]["name"])
    user.save
    user
  end

  def self.create_guest
    user = User.create(name: "Guest")
  end

end
