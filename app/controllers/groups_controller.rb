class GroupsController < ApplicationController
    before_action :get_edit_target_group, only: [:edit, :update]

    def new
        @group = Group.new
    end

    def create
        @group = Group.new(group_params)
        if @group.save
            redirect_to root_path, notice: 'グループを作成しました。'
        else
            redirect_to root_path, alert: 'グループを作成できませんでした。'
        end
    end

    def edit
        # before_actionにより対象データを事前取得してある。
    end

    def update
        # before_actionにより対象データを事前取得してある。
        if @edit_target_group.update(group_params)
            redirect_to root_path, notice: 'グループを編集しました。'
        else
            redirect_to root_path, alert: 'グループを編集できませんでした。'
        end
    end

    private

    def group_params
        params.require(:group).permit(:group_name, user_ids: [])
    end

    def get_edit_target_group
        @edit_target_group = Group.includes(:groups_users).find(params[:id])
    end
end
