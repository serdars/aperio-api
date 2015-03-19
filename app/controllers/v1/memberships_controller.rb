class V1::MembershipsController < ApplicationController
  def create
    group_id = params[:group_id] ||
      Organization.find(params[:organization_id]).all_members_group.id
    user_id = params[:user_id] || current_user.id
    @membership = Membership.new(user_id: user_id, group_id: group_id)

    if @membership.save
      render json: @membership
    else
      render json: {
        message: "Membership creation failed!"
      }, status: :bad_request
    end
  end
end
