class GroupsController < ApplicationController
    def edit; end

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

    private

    def group_params
        params.require(:group).permit(:group_name, user_ids: [])
    end
end
