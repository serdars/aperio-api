class V1::OrganizationsController < ApplicationController
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

  def update
    @organization = Organization.find(params[:id])

    if @organization.update(organization_params)
      render json: @organization
    else
      render json: {
        message: "Organization update failed!"
      }, status: :bad_request
    end
  end

  def show
    @organization = Organization.find(params[:id])

    render json: @organization
  end

  private
  def organization_params
    params.require(:organization).permit(:name, :motto)
  end
end
