require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  login_user

  before(:each) do
    @campaign = FactoryGirl.create(:campaign)
  end

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
    before { allow(controller).to receive(:current_user) { @campaign.user } }

    context "when a campaign is valid" do
      it "redirects to #show" do
        allow(@campaign).to receive(:save).and_return(true)
        allow(Campaign).to receive(:new).
          with(name: "User signup").
          and_return(@campaign)

        post :create, campaign: { name: "User signup" }

        expect(response).to redirect_to(campaign_path(@campaign))
      end
    end

    context "when a campaign is invalid" do
      it "redirects to #new" do
        allow(@campaign).to receive(:save).and_return(false)
        allow(Campaign).to receive(:new).with(name: "").and_return(@campaign)

        post :create, campaign: { name: "" }

        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    before { allow(controller).to receive(:current_user) { @campaign.user } }

    context "with valid attributes" do
      it "redirects to #show" do
        allow(@campaign).to receive(:update).and_return(true)
        allow(Campaign).to receive(:find).with(@campaign.to_param).
          and_return(@campaign)

        patch :update, id: @campaign.id, campaign: { name: "Student Campaign" }

        expect(response).to redirect_to(campaign_path(@campaign))
      end
    end

    context "with invalid attributes" do
      it "redirects to #edit" do

        allow(@campaign).to receive(:update).and_return(false)
        allow(Campaign).to receive(:find).
          with(@campaign.id).and_return(@campaign)

        patch :update, id: @campaign.id, campaign: { name: "" }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    before { allow(controller).to receive(:current_user) { @campaign.user } }

    it "deletes the campaign" do
      expect {
        delete :destroy, id: @campaign
      }.to change(Campaign, :count).by(-1)
    end

    it "redirects to campaigns#index" do
      delete :destroy, id: @campaign
      expect(response).to redirect_to(campaigns_url)
    end
  end
end
