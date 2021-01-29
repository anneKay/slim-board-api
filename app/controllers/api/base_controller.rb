class Api::BaseController < ActionController::API
  before_action :authorized_user

  attr_reader :current_user

  # require "jwt_provider"

  def get_token_from_header
    auth_header.split(' ').last if auth_header
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    payload = JwtProvider.decode(get_token_from_header) if get_token_from_header
  rescue JWT::DecodeError
    unauthorized_response('Invalid token')
  end

  def current_user
    @current_user ||= User.find(payload['user_id']) unless decoded_token.error
  end

  def logged_in?
    !!current_user
  end

  def unauthorized_response(message='')
    render json: { error: "unauthorized access. #{message}", status: 401 }
  end

  def authorized_user
    unauthorized_response unless logged_in?
  end

end