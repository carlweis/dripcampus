module Account
  class MailingListsController < ApplicationController
    def index
      @mailing_lists = MailingList.where(user_id: current_user.id).page params[:page]
    end

    def new
    end

    def create
      @mailing_list = MailingList.new(list_params)
      if @mailing_list.save
        redirect_to @mailing_list
      else
        render 'new'
      end
    end

    def show
      @mailing_list = MailingList.find(params[:id])
    end

    private
      def list_params
        params.require(:mailing_list).permit(:name, :description)
      end
  end
end