# Preview all emails at http://localhost:3000/rails/mailers/campaign_notifier
class CampaignNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/campaign_notifier/notify
  def notify(campaign, subscriber, message)
    CampaignNotifier.notify(campaign, subscriber, message)
  end

end
