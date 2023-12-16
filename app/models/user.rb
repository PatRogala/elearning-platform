# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :fullname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :reset_password_token, uniqueness: true, allow_nil: true
end
