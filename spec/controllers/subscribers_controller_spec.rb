require 'rails_helper'

RSpec.describe SubscribersController, type: :controller do
  login_user

  before(:each) do
    @campaign = FactoryGirl.create(:campaign)
  end

  describe "GET #index" do

    it "returns http success" do
      get :index, { campaign_id: @campaign.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, { campaign_id: @campaign.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "when subscriber is valid" do
      it "redirects to #show" do
        subscriber = FactoryGirl.create(:subscriber, email: "test@example.com")
        allow(subscriber).to receive(:save).and_return(true)
        allow(Subscriber).to receive(:new).
          with(email: "test@example.com").
          and_return(subscriber)

        post :create, {campaign_id: @campaign.id, 
          subscriber: { email: "test@example.com" } }

        expect(response).to redirect_to(campaign_subscriber_path(@campaign.id, subscriber))
      end
    end

    context "when a subscriber is invalid" do
      it "redirects to #new" do
        subscriber = double("subscriber")
        allow(subscriber).to receive(:save).and_return(false)
        allow(Subscriber).to receive(:new).with(email: "").and_return(subscriber)

        post :create, {campaign_id: @campaign.id, subscriber: { email: "" }}

        expect(response).to render_template(:new)
      end
    end
  end
end
