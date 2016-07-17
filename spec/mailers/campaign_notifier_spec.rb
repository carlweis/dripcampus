require "rails_helper"

RSpec.describe CampaignNotifier, type: :mailer do
  describe "notify" do
    let(:campaign)   { FactoryGirl.create(:campaign) }
    let(:subscriber) { FactoryGirl.create(:subscriber) }
    let(:message)    { FactoryGirl.create(:message) }
    let(:mail)       { CampaignNotifier.notify(campaign, subscriber, message) }

    it "renders the headers" do
      expect(mail.subject).to eq(message.subject)
      expect(mail.to).to eq([subscriber.email])
      expect(mail.from).to eq(["noreply@dripcampus.com"])
    end

    it "renders the subject" do
      expect(mail.subject).to eq(message.subject)
    end

    it "renders the body" do
      expect(mail.body.encoded).to match(message.body)
    end
  end

end
