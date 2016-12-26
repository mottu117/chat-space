class MessegesController < ApplicationController
    def index
        @current_user_groups = appfunc_get_current_user_groups # application_controllerより継承
        @group = Group.find(params[:group_id])
    end
end
