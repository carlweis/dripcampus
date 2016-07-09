module Account
	class ProspectsController < ApplicationController
		def index
			@prospects = Prospect.where(user_id: current_user.id).page params[:page]
		end

		def show
			begin
				@prospect = Prospect.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				redirect_to account_prospects_path
			end
		end
	end
end