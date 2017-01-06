class GroupsController < ApplicationController
    before_action :get_target_group, only: [:edit, :update]

    def index
        @current_user_groups = appfunc_get_current_user_groups # application_controllerより継承
    end

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            redirect_to root_path, notice: 'グループを作成しました。'
        else
            redirect_to root_path, alert: 'グループを作成できませんでした。グループ名が未入力の可能性があります。'
        end
    end

    def edit
        # before_actionにより対象データを事前取得してある。
    end

    def update
        # before_actionにより対象データを事前取得してある。
        if @target_group.update(group_params)
            redirect_to root_path, notice: 'グループを編集しました。'
        else
            redirect_to root_path, alert: 'グループを編集できませんでした。グループ名が未入力の可能性があります。'
        end
    end

    private

    def group_params
        params.require(:group).permit(:group_name, user_ids: [])
    end

    def get_target_group
        @target_group = Group.find(params[:id])
    end
end
