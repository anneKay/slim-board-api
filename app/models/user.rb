class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { minimum: 10 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { minimum: 10, maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX}

  has_secure_password
end
