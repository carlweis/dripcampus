class CampaignNotifier < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.campaign_notifier.notify.subject
  #
  def notify(campaign, subscriber, message)
    @campaign = campaign
    @subscriber = subscriber
    @message = message

    mail to: subscriber.email, subject: message.subject
  end
end
