class SubscribersController < ApplicationController
  before_action :set_campaign, only: [:index, :new, :create, :show, :edit]
  before_action :set_subscriber, only: [:show, :edit, :update, :destroy]

  def index
    @subscribers = @campaign.subscribers.order(:email).page params[:page]
    if params[:search]
      @subscribers = @campaign.subscribers.search(params[:search]).
        order(:email).page params[:page]
    end
  end

  def show
  end

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = @campaign.subscribers.build(subscriber_attributes)
    if @subscriber.save
      redirect_to [@campaign, @subscriber],
        notice: "Subscriber #{@subscriber.email} successfully created."
    else
      render :new
    end
  end

  private
    def set_campaign
      @campaign = current_user.campaigns.find(params[:campaign_id])
    end

    def set_subscriber
      @subscriber = Subscriber.find(params[:id])
    end

    def subscriber_attributes
      params.require(:subscriber).permit(:email, :first_name, :last_name, :source)
    end
end
