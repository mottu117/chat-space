class GroupsController < ApplicationController
    before_action :initialize_group_instance, only: [:new, :create]
    before_action :get_target_group, only: [:edit, :update]

    def index
        @current_user_groups = appfunc_get_current_user_groups # application_controllerより継承
    end

    def new
        # before_actionによりGroupインスタンスを事前生成してある。
    end

    def create
        # before_actionによりGroupインスタンスを事前生成してある。
        group = Group.new(group_params)
        if group.save
            redirect_to root_path, notice: 'グループを作成しました。'
        else
            @error_message = 'グループを作成できませんでした。グループ名が未入力の可能性があります。'
            render new_group_path
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
            @error_message = 'グループを編集できませんでした。グループ名が未入力の可能性があります。'
            render action: :edit
        end
    end

    private

    def initialize_group_instance
        @group = Group.new
    end

    def group_params
        params.require(:group).permit(:group_name, user_ids: [])
    end

    def get_target_group
        @target_group = Group.find(params[:id])
    end
end
