class ProcessCampaignsWorker
  # NOTE: This may not be the best way to perform the processing.
  #       It may be more effecient to partition the jobs into batches.
  def perform
    # get all users
    users = User.all
    users.each do |user|
      # for each user, create a new sidekiq job to process their campaigns
      user.campaigns.each do |campaign|
        # we need to schedule a job for each subscriber
        campaign.subscribers.each do |subscriber|
          # kick off the sidekiq job to process the campaign
          logger.info "Processing Campaign #{campaign.id} for User: #{user.id} and Subscriber #{subscriber.id}"
          CampaignWorker.perform_async(user.id, campaign.id, subscriber.id)
        end
      end
    end
  end
end
