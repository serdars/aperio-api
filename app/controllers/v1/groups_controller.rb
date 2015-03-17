class V1::GroupsController < ApplicationController
  def create
    @group = Group.new(group_params.merge({visible: true, private: false}))

    if @group.save
      render json: @group
    else
      render json: {
        message: "Group creation failed!"
      }, status: :bad_request
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, :motto, :organization_id, :visible, :private)
  end

end
