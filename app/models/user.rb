class User < ApplicationRecord
  has_secure_password validations: false

  validates :password_digest, presence: true
end
