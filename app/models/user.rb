class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :timeoutable, :recoverable, :rememberable, :trackable,
         :validatable, :lockable
  devise :omniauthable, :omniauth_providers => [:facebook]
end
