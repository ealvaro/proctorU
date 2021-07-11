# frozen_string_literal: true

# This controller handles the endpoints for the Users
class UsersController < ApplicationController
  include ActionController::MimeResponds
  include UserValidations
  before_action :set_user, only: [:validate, :index]

  # GET /users
  def index
    @users = User.all
  end

  # POST /users/validate
  def validate
    user_params
    @errors = []
    render json: { response: 'Valid User' } and return if validations

    render json: { validation_error: @errors }, status: 400
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    if params[:id]
      @user = User.find(params[:id])
    elsif params[:first_name] && params[:last_name]
      @user = User.find_by_first_and_last_name(params[:first_name], params[:last_name])
    end
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.permit(:id, :first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
  end
end
