class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :omniauthable, omniauth_providers: [:oktaoauth]
  #RETRIEVE EXISTING USER, OR CREATE NEW USER
  def self.from_omniauth(auth)
    User.find_or_create_by(email: auth["info"]["email"]) do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.email = auth['info']['email']
    end
  end
end
