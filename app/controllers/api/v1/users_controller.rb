class Api::V1::UsersController < ApplicationController
  def create
    @user = User.new(user_params)

    if @user.save
      render json: current_user
    else
      render json: {
        message: "User creation failed!"
      }, status: :bad_request
    end

  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      render json: current_user
    else
      render json: {
        message: "User update failed!"
      }, status: :bad_request
    end
  end

  # Dev methods

  def current
    render json: current_user
  end

  def timeline
    render json: Action.all, root: "timeline"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
