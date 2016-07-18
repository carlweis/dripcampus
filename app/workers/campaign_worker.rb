class CampaignWorker
  include Sidekiq::Worker

  def perform(user_id, campaign_id, subscriber_id)
    user     = User.find(user_id)
    campaign = user.campaigns.find(campaign_id)
    campaign.messages.each do |message|
      SubscriberWorker.perform_in(
        eval("#{message.wait}.#{message.interval}"),
        user_id, campaign_id, subscriber_id, message_id
      )
    end
  end
end
