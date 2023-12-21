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
  validates :avatar, blob: { content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 0..(1.megabytes) }, allow_nil: true

  def initials
    return "" if fullname.blank?

    fullname.split.map(&:first).join.upcase
  end
end
