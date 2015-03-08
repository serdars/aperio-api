class Api::V1::OrganizationsController < ApplicationController
  def create
    @organization = Organization.new(organization_params)

    if @organization.save
      render json: @organization
    else
      render json: {
        message: "Organization creation failed!"
      }, status: :bad_request
    end
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :motto)
  end
end
