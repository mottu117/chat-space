class MessagesController < ApplicationController
    def index
        @current_user_groups = appfunc_get_current_user_groups # application_controllerより継承
        @group = Group.find(params[:group_id])
        @message = Message.new # form_for渡し
    end

    def create
        message = Message.new(message_params)
        if message.valid?
            if message.save(message_params)
                respond_to do |format|
                    format.html { redirect_to group_messages_path }

                    format.json do
                        render json: message, status: 200
                    end
                end
            else
                redirect_to group_messages_path, alert: '投稿に失敗しました。管理者に確認してください。'
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
end
