class GroupsController < ApplicationController

    def index
        @find_id = "86"
        @group_sample_name = Group.find(@find_id)
        @group_sample_member = GroupsUser.where(groups_users: {group_id: @find_id} )
        @user_joined_group_lists = Group.includes(:groups_users).where(groups_users: {user_id: current_user.id} )
        # binding.pry
    end

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

    end



    private

    def group_params
        params.require(:group).permit(:group_name, user_ids: [])
    end
end
