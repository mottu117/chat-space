class MessagesController < ApplicationController
  def index
    @current_user_groups = appfunc_get_current_user_groups # application_controllerより継承
    @group = Group.find(params[:group_id])
    @most_recent_message_id = @group.messages.maximum('id')
    @message = Message.new # form_for渡し

    unless message_difference.nil? # メッセージ差分が無いときはajaxしない
      respond_to do |format|
        format.html { redirect_to group_messages_path }

        format.json do
          render json: message_difference, status: 200
        end
      end
    end
  end

  def create
    message = Message.new(message_params)
    if message.save(message_params)
      respond_to do |format|
        format.html { redirect_to group_messages_path }

        format.json do
          render json: message, status: 200
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to group_messages_path }

        format.json do
          render nothing: true, status: 400
        end
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:text, :image_url).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def message_difference
    if params[:most_recent_message_id]
      @group.messages.where("id > #{params[:most_recent_message_id]}")
    end
  end
end
