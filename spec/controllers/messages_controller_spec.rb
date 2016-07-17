require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  login_user

  before(:each) do
    @campaign = FactoryGirl.create(:campaign)
    @message  = FactoryGirl.create(:message)
  end

  describe "GET #index" do
    before { allow(controller).to receive(:current_user) { @campaign.user } }

    it "returns http success" do
      get :index, { campaign_id: @campaign.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    before { allow(controller).to receive(:current_user) { @campaign.user } }

    it "returns http success" do
      get :new, { campaign_id: @campaign.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    before { allow(controller).to receive(:current_user) { @campaign.user } }
    context "when message is valid" do
      it "redirects to #show" do
        message = FactoryGirl.create(:message)
        allow(message).to receive(:save).and_return(true)
        allow(Message).to receive(:new).
          with(subject: "test subject").
          and_return(message)

        post :create, {campaign_id: @campaign.id, message: { subject: "test subject"} }

        expect(response).to redirect_to(campaign_message_path(@campaign.id, message))
      end
    end

    context "when a subscriber is invalid" do
      it "redirects to #new" do
        message = FactoryGirl.create(:message)
        allow(message).to receive(:save).and_return(false)
        allow(Message).to receive(:new).with(subject: "").and_return(message)

        post :create, {campaign_id: @campaign.id, message: { subject: "" }}

        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH #update" do
    before { allow(controller).to receive(:current_user) { @campaign.user } }

    context "with valid attributes" do
      it "redirects to #show" do
        message = FactoryGirl.create(:message, campaign_id: @campaign.id)
        allow(message).to receive(:update).and_return(true)
        allow(Message).to receive(:find).with(message.to_param).and_return(message)

        patch :update, id: message.id, campaign_id: @campaign.id, message: { subject: "test subject" }

        expect(response).to redirect_to(campaign_message_path(@campaign, message))
      end
    end

    context "with invalid attributes" do
      it "redirects to #edit" do
        message = FactoryGirl.create(:message, campaign_id: @campaign.id)
        allow(message).to receive(:update).and_return(false)
        allow(Message).to receive(:find).with(message.to_param).and_return(message)

        patch :update, id: message.id, campaign_id: @campaign.id, message: { subject: "" }

        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    before { allow(controller).to receive(:current_user) { @campaign.user } }

    it "deletes the message" do
      expect {
        delete :destroy, id: @message, campaign_id: @campaign
      }.to change(Message, :count).by(-1)
    end

    it "redirects to messages#index" do
      delete :destroy, id: @message, campaign_id: @campaign
      expect(response).to redirect_to(campaign_messages_url(@campaign))
    end
  end
end
