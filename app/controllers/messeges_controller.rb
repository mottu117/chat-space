class MessegesController < ApplicationController
    before_action :authenticate_user!

    def index
        @find_id = "86" #仮置き
        @group_sample_name = Group.find(@find_id)
        @group_sample_member = GroupsUser.where(groups_users: {group_id: @find_id} )
        @user_joined_group_lists = Group.includes(:groups_users).where(groups_users: {user_id: current_user.id} )
    end

end
