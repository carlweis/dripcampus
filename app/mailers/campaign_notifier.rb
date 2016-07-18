class CampaignNotifier < ApplicationMailer

  def notify(campaign, subscriber, message)
    @campaign = campaign
    @subscriber = subscriber
    @message = message

    mail to: subscriber.email, subject: message.subject
  end
end
