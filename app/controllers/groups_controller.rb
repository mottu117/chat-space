class GroupsController < ApplicationController
    def edit

    end


     def new
      @group = Group.new
      @current_user_id = current_user.id
      @current_user_nickname = current_user.nickname
     end

     def create
      @group = Group.new(group_params)
      @group.save
      redirect_to root_path, notice: 'グループを作成しました。'
     end

     private
     def group_params
      params.require(:group).permit(:group_name, :nickname, { user_ids:[] })
     end
    end
