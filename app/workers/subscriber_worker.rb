class SubscriberWorker
  include Sidekiq::Worker

  def perform(user_id, campaign_id, subscriber_id, message_id)
    user       = User.find(user_id)
    campaign   = user.campaigns.find(campaign_id)
    subscriber = campaign.subscribers.find(subscriber_id)
    message    = campaign.messages.find(message_id)
    
    # deliver the email to the subscriber
    CampaignNotifier.notify(campaign, subscriber, message).deliver_later
  end

end
