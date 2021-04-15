class ErrorsController < ApplicationController
  def error_404
    @requested_path = request.path
    render json: {routing_error: @requested_path}
  end
end
