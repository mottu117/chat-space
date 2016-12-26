class MessegesController < ApplicationController

    def index
        @user_joined_group_lists = appfunc_get_user_joined_group_lists #application_controllerより継承
        @find_id = params[:group_id]
        @group_info = Group.find(@find_id)
    end

end
