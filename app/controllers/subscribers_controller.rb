class SubscribersController < ApplicationController
  before_action :set_campaign_and_subscriber, only: [:show, :edit, :update, :destroy]

  def index
    @campaign = Campaign.find(params[:campaign_id])
    @subscribers = Subscriber.order(:email).page params[:page]
    if params[:search]
      @subscribers = Subscriber.search(params[:search]).
        order(:email).page params[:page]
    end
  end

  def show
  end

  def new
    @subscriber = Subscriber.new
  end

  def edit
  end

  def create
    @subscriber = Subscriber.new(subscriber_attributes)
    if @subscriber.save
      redirect_to @subscriber,
        notice: "Subscriber #{@subscriber.email} successfully created."
    else
      render :new
    end
  end

  def update
    if @subscriber.update(subscriber_attributes)
      redirect_to @subscriber,
        notice: "Subscriber #{@subscriber.email} has been updated."
    else
      render :edit
    end
  end

  def destroy
    @subscriber.destroy
    redirect_to subscribers_url(params[:campaign_id]),
      notice: "Subscriber was successfully deleted."
  end

  private
    def set_campaign_and_subscriber
      @campaign = Campaign.find(params[:campaign_id])
      @subscriber = Subscriber.find(params[:id])
    end

    def subscriber_attributes
      params.require(:subscriber).permit(:email, :first_name, :last_name, :source)
    end
end
