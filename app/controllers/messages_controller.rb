class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_campaign, only: [:index, :new, :create, :update, :show, :edit]

  def index
    @messages = @campaign.messages.order(:subject).page params[:page]
    if params[:search]
      @messages = @campaign.messages.search(params[:search]).
        order(:subject).page params[:page]
    end
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    @message = @campaign.messages.build(message_attributes)
    if @message.save
      redirect_to [@campaign, @message],
        notice: "Campaign Message successfully created."
    else
      render :new
    end
  end

  def update
    if @message.update(message_attributes)
      redirect_to [@campaign, @message],
        notice: "Campaign Message #{@message.subject} has been updated."
    else
      render :edit
    end
  end

  def destroy
    @message.destroy
    redirect_to campaign_messages_url, notice: 'Message successfully deleted.'
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def set_campaign
      @campaign = current_user.campaigns.find(params[:campaign_id])
    end

    def message_attributes
      params.require(:message).permit(
        :campaign_id, :subject, :body, :delay, :interval
      )
    end
end
