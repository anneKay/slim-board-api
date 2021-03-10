module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthenticationError < StandardError; end
  class MissingToken < StandardError; end
  class InvalidToken < StandardError; end

  included do
    rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
    rescue_from ExceptionHandler::MissingToken, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidToken, with: :four_twenty_two
  end

  private

  # JSON response with Status code 422 - unprocessable entity
  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end

  #JSON response with Status code 401 - Unauthorized
  def unauthorized_request(e)
    json_response({ message: e.message }, :unauthorized)
  end
end
