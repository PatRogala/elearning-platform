# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar do |attachable|
    attachable.variant :thumb, resize: "50x50"
    attachable.variant :medium, resize: "100x100"
  end

  validates :fullname, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :reset_password_token, uniqueness: true, allow_nil: true

  def initials
    fullname.split.map(&:first).join.upcase
  end
end
