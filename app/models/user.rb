class User < ActiveRecord::Base
  has_many :comments, :dependent => :destroy


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      if(auth["user_info"]["nickname"])
        user.name = auth["user_info"]["nickname"]
      else
        user.name = auth["user_info"]["name"]
      end
    end
  end

end
