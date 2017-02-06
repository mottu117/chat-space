class MessagesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])

    respond_to do |format|
      format.html do
        @current_user_groups = appfunc_get_current_user_groups # application_controllerより継承
        @message = Message.new # form_for渡し
      end
      format.json do
        unless messages_still_load.nil? # メッセージ差分が無いときはajaxしない
          render json: messages_still_load, status: 200
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

  def messages_still_load # 画面上に存在しないメッセージIDを求める。
    if params[:recent_message_ids]
      @group.messages.where("id not in( #{params[:recent_message_ids]} )")
    end
  end
end
