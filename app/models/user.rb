class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX}

  has_secure_password

  def self.user_json(user)
    user.as_json(except: [:password_digest])
  end
end
