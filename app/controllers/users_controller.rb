# frozen_string_literal: true

# This controller handles the endpoints for the Users
class UsersController < ApplicationController
  include UserValidations
  before_action :set_user, only: [:validate]

  # POST /users/validate
  def validate
    byebug
    user_params
    @errors = []
    render json: { true: 'Valid User' } and return if validations

    render json: { validation_error: @errors }, status: 400
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:id, :first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
    end

end
