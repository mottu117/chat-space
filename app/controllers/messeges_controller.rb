class MessegesController < ApplicationController
    before_action :authenticate_user!

    def index
        @user_joined_group_lists = Group.includes(:groups_users).where(groups_users: {user_id: current_user.id} )
        @find_id = params[:group_id]
        if @find_id
          @group_name = Group.find(@find_id)
          @group_member = GroupsUser.where(groups_users: {group_id: @find_id} )

        end
    end

end
