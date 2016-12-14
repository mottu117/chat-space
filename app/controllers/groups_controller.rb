class GroupsController < ApplicationController
    def edit

    end


    def new

    end


    def create
      Group.create(group_name: params[:chat_group_name])
      redirect_to root_path, notice: 'グループを作成しました。'

    end
end
