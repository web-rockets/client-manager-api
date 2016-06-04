class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  rescue_from ActionController::ParameterMissing, :with => :parameter_missing
  rescue_from ActiveModel::ForbiddenAttributesError, :with => :forbidden_attributes_error

private
  def record_not_found
    render json: {message: "record_not_found"}, status: 400
  end

  def parameter_missing
    render json: {message: "parameter_missing"}, status: 400
  end

  def forbidden_attributes_error
    render json: {message: "forbidden_attributes_error"}, status: 400
  end
end
