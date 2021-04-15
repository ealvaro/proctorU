class UsersController < ApplicationController
  include UserValidations
  before_action :set_user, only: [:show, :validate]

  # POST /users/validate
  def validate
    @errors = []
    render json: {true: 'Valid User'} and return if validations
    render json: { validation_error: @errors }, status: 400
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      # params.require(:user).permit(:first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
      params.require(:user, :first_name, :last_name, :phone_number, :college_id, :exam_id, :start_time)
    end

end
