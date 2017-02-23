class User < ApplicationRecord
  has_secure_password

  validates :username, :password_digest, :email, :gw2_character_id, presence: true
  validates :username, :email, :gw2_character_id, uniqueness: true
end
