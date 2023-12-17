class Course < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :thumb, resize: "300x168"
    attachable.variant :medium, resize: "900x506"
  end

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :image, presence: true
end
