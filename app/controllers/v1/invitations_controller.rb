class V1::InvitationsController < ApplicationController
  def create
    @organization = Organization.find(invitation_params[:organization_id])
    @invitee = User.find(invitation_params[:invitee_id])

    @invitation = Invitation.new({
      inviter: current_user,
      invitee: @invitee,
      organization: @organization,
      state: :waiting
    })

    if @invitation.save
      render json: @invitation
    else
      render json: {
        message: "Invitation creation failed!"
      }, status: :bad_request
    end
  end

  private
  def invitation_params
    params.require(:invitation).permit(:invitee_id, :inviter_id, :organization_id)
  end
end
