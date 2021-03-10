class AuthorizeApiRequest

  def initialize(headers)
    @headers = headers
  end

  def call
    { user: user }
  end

  private

  attr_reader :headers

  def get_token_from_header
    auth_header.split(' ').last if auth_header.present?
    raise(ExceptionHandler::MissingToken, Message.missing_token)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    @decode_token ||= JwtProvider.decode(get_token_from_header) if get_token_from_header
    raise(ExceptionHandler::InvalidToken, Message.invalid_token)
  end

  def user
    @user ||= User.find(decoded_token["user_id"]) if decoded_token
  end

end