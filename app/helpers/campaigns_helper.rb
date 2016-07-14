module CampaignsHelper
  def campaign_status_class(campaign)
    campaign.active ? 'campaign-active' : 'campaign-inactive'
  end
end
