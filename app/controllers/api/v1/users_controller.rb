class Api::V1::UsersController < ApplicationController
  def current
    render json: User.all.sample
  end

  def timeline
    render json: Action.all, root: "timeline"
  end
end
