module Account
	class ProspectsController < ApplicationController
		def index
			@prospects = Prospect.where(user_id: current_user.id)
		end
	end
end