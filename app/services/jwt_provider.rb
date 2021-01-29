class JwtProvider

  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  def self.encode(payload)
    payload = payload.dup
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY, true)[0]
  # rescue StandardError => error
  #   error
    # add ability to access key as symbol or string
    HashWithIndifferentAccess.new decoded
  end
end