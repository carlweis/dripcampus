require 'rails_helper'

RSpec.describe Account::DashboardController, type: :controller do
	login_user

	describe "GET #index" do

		it "should return the users dashboard" do
			get :index
			expect(response).to have_http_status(:success)
		end

	end
end
