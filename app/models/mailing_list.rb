class MailingList < ActiveRecord::Base
	belongs_to :user
	
	before_create :set_listid

  private
  	def set_listid
  		self.listid = SecureRandom.uuid
  	end
end
