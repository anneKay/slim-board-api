class Api::BaseController < ActionController::API
  include Response
  include ExceptionHandler

  before_action :authorized_user
  attr_reader :current_user

  private

  def authorized_user
    @current_user = (AuthorizeApiRequest.new(request.headers).call)[:user]
  end
end