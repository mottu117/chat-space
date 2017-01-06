class MessagesController < ApplicationController
    def index
        @current_user_groups = appfunc_get_current_user_groups # application_controllerより継承
        @group = Group.find(params[:group_id])

        @message = Message.new # form_forに渡す
        @index_messages = Message.where(group_id: params[:group_id]) # messageの一覧表示データ
    end

    def create
        @input_message = Message.new(message_params)
        if @input_message.save
            redirect_to group_messages_path, notice: 'メッセージを投稿しました。'
        else
            redirect_to group_messages_path, alert: 'メッセージを投稿できませんでした。'
        end
    end

    private

    def message_params
        params.require(:message).permit(:text, :image_url).merge(group_id: params[:group_id], user_id: current_user.id)
    end
end
