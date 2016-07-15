class CampaignsController < ApplicationController
  before_action :set_campaign, only: [:show, :edit, :update, :destroy]

  def index
    @campaigns = Campaign.order(:name).page params[:page]
    if params[:search]
      @campaigns = Campaign.search(params[:search]).
        order(:name).page params[:page]
    end
  end

  def show
  end

  def new
    @campaign = Campaign.new
  end

  def edit
  end

  def create
    @campaign = Campaign.new(campaign_attributes)
    if @campaign.save
      redirect_to @campaign,
        notice: "Drip Campaign #{@campaign.name} successfully created."
    else
      render :new
    end
  end

  def update
    if @campaign.update(campaign_attributes)
      redirect_to @campaign, 
        notice: "Drip Campagin #{@campaign.name} has been updated."
    else
      render :edit
    end
  end

  def destroy
    @campaign.destroy
    redirect_to campaigns_url, notice: 'Campaign was successfully deleted.'
  end


  private
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def campaign_attributes
      params.require(:campaign).permit(:name, :description, :tags)
    end
end
