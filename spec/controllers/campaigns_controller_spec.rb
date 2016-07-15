require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  login_user

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "when a campaign is valid" do
      it "redirects to #show" do
        campaign = new_campaign
        allow(campaign).to receive(:save).and_return(true)
        allow(Campaign).to receive(:new).
          with(name: "User signup").
          and_return(campaign)

        post :create, campaign: { name: "User signup" }

        expect(response).to redirect_to(campaign_path(campaign))
      end
    end

    context "when a campaign is invalid" do
      it "redirects to #new" do
        campaign = double("campaign")
        allow(campaign).to receive(:save).and_return(false)
        allow(Campaign).to receive(:new).with(name: "").and_return(campaign)

        post :create, campaign: { name: "" }

        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid attributes" do
      it "redirects to #show" do
        campaign = new_campaign
        allow(campaign).to receive(:update).and_return(true)
        allow(Campaign).to receive(:find).with(campaign.to_param).
          and_return(campaign)

        patch :update, id: campaign.id, campaign: { name: "Student Campaign" }

        expect(response).to redirect_to(campaign_path(campaign))
      end
    end

    context "with invalid attributes" do
      it "redirects to #edit" do
        campaign = double("campaign", id: "1")
        allow(campaign).to receive(:update).and_return(false)
        allow(Campaign).to receive(:find).
          with(campaign.id).and_return(campaign)

        patch :update, id: campaign.id, campaign: { name: "" }

        expect(response).to render_template(:edit)
      end
    end
  end

  def new_campaign
    user = FactoryGirl.build(:user)

    campaign = Campaign.create(
      user_id: user.id,
      name: "User signup",
      description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      tags: "signup, new-user, registration"
    )
    return campaign
  end
end
