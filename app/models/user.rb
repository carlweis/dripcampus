class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :timeoutable, :recoverable, :rememberable, :trackable,
         :validatable, :lockable
  devise :omniauthable, :omniauth_providers => [:facebook]

  before_create :set_account_id

  has_many :campaigns  

  private
  	def set_account_id
  		self.account_id = SecureRandom.uuid
  	end
end
