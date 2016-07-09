require 'rails_helper'

RSpec.describe Application::DashboardController, type: :controller do
	describe "GET #index" do
		before(:each) do
			@user = Factory.build(:user)
			sign_in @user
		end

		it "should return the users dashboard" do
			get :index
			expect(response).to have_http_status(:success)
		end

	end
end