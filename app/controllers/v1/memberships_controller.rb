class V1::MembershipsController < ApplicationController
  def create
    joinable = if params[:group_id]
      Group.find(params[:group_id])
    else
      Organization.find(params[:organization_id])
    end

    user_id = params[:user_id] || current_user.id
    @membership = Membership.new(user_id: user_id, joinable: joinable)

    if @membership.save
      render json: @membership
    else
      render json: {
        message: "Membership creation failed!"
      }, status: :bad_request
    end
  end
end
