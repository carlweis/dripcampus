require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
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
    context "when message is valid" do
      it "redirects to #show" do
        message = FactoryGirl.create(:message)
        allow(message).to receive(:save).and_return(true)
        allow(Message).to receive(:new).
              with(subject: "test message", body: "test body",
                   delay: 10, interval: "minutes").
              and_return(message)

        post :create, { campaign_id: @campaign.id,
          message: { subject: "test message", body: "test body",
                     delay: 10, interval: "minutes"} }

        expect(response).to redirect_to(campaign_message_path(@campaign.id, message))
      end
    end

    context "when a message is invalid" do
      it "redirects to #new" do
        message = double("message")
        allow(message).to receive(:save).and_return(false)
        allow(Message).to receive(:new).with(subject: "").and_return(message)

        post :create, { campaign_id: @campaign.id, subscriber: { subject: ""} }

        expect(response).to render_template(:new)
      end
    end
  end
  
  describe "PATCH #update" do
    context "with valid attributes" do
      it "redirects to #show" do
        message = FactoryGirl.create(:message)
        allow(message).to receive(:update).and_return(true)
        allow(Message).to receive(:find).with(message.to_param).
          and_return(message)

        patch :update, id: message.id, message: { subject: "Update message",
                                                  body: "Update body",
                                                  delay: 10,
                                                  interval: "minutes" }

        expect(response).to redirect_to(campaign_message_path(@campaign.id, message.id))
      end
    end

    context "with invalid attributes" do
      it "redirects to #edit" do
        message = double(message, id: "1")
        allow(message).to receive(:update).and_return(false)
        allow(Message).to receive(:find).
          with(message.id).and_return(message)

        patch :update, id: message.id, message: { subject: "" }

        expect(response).to render_template(:edit)
      end
    end
  end
end
