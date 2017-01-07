class MessagesController < ApplicationController
    def index
        @current_user_groups = appfunc_get_current_user_groups # application_controllerより継承
        @group = Group.find(params[:group_id])
        @message = Message.new #form_for渡し
    end

    def create
        message = Message.new(message_params)
        if message.save(message_params)
            redirect_to group_messages_path, notice: 'メッセージを投稿しました。'
        else
            redirect_to group_messages_path, alert: 'メッセージを投稿できませんでした。テキストが未入力の可能性があります。'
        end
    end

    private

    def message_params
        params.require(:message).permit(:text, :image_url).merge(group_id: params[:group_id], user_id: current_user.id)
    end
end
